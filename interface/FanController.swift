import Cocoa
import Foundation
import IOKit.hid

class FanController {
    private var configurationController: ConfigurationController
    private var fans:[Fan]

    init(_ configurationController: ConfigurationController) {
        self.configurationController = configurationController
        self.fans = []
        do {
            self.fans = try SMCKit.allFans()
        }
        catch {
            print("Failed to get fans from SMC")
            return
        }
    }
    
    func printInformation() {
        for fan in self.fans {
            print("[id \(fan.id)] \(fan.name)")
            print("\tMin: \(fan.minSpeed) RPM")
            print("\tMax: \(fan.maxSpeed) RPM")
            guard let currentSpeed = try? SMCKit.fanCurrentSpeed(fan.id) else {
                print("\tSpeed: Unknown")
                return
            }
            print("\tSpeed: \(currentSpeed) RPM")
        }
    }
    
    func isFanAuto(_ id: Int) -> Bool {
        do {
            return try SMCKit.fanIsAuto(id)
        }
        catch {
            print("Failed to get fan mode")
            return false
        }
    }
    
    func setFansAuto(_ auto: Bool) {
        do {
            for fan in fans {
                try SMCKit.fanSetAuto(fan.id, auto)
            }
        }
        catch {
            print("Failed to set fan mode")
        }
    }
    
    func setFanAuto(_ id: Int, _ auto: Bool) {
        do {
            try SMCKit.fanSetAuto(id, auto)
        }
        catch {
            print("Failed to set fan mode")
        }
    }
    
    func getFanSpeed(_ id:Int) -> Int {
        do {
            return try SMCKit.fanCurrentSpeed(id)
        }
        catch {
            print("Failed to get fan speed")
            return 0
        }
    }
    
    func setFanSpeed(_ id: Int, _ speed: Int) {
        do {
            try SMCKit.fanSetTargetSpeed(id, speed)
        }
        catch {
            print("Failed to set fan speed")
        }
    }
    
    func update(_ temperature: Int) {
        do {
            var targetTemperature = 0
            var targetPercentage = 0
            if (temperature < configurationController.minTargetTemperature) {
                targetTemperature = 0
                targetPercentage = 0
            }
            else if (temperature > configurationController.maxTargetTemperature) {
                targetTemperature = temperature
                targetPercentage = 100
            }
            else {
                for target in configurationController.temperatureTargets {
                    if (target.0 >= temperature) {
                        targetTemperature = target.0
                        targetPercentage = target.1
                        break
                    }
                }
            }
            for fan in fans {
                if (targetTemperature == 0 || targetPercentage == 0) {
                    if (try !SMCKit.fanIsAuto(fan.id)) {
                        setFanAuto(fan.id, true)
                    }
                    return
                }
                let minSpeed = fan.minSpeed
                let maxSpeed = fan.maxSpeed
                setFanAuto(fan.id, false)
                let targetSpeed = Double(maxSpeed) * (Double(targetPercentage) / 100)
                var interpolatedSpeed = Int(targetSpeed * (Double(temperature) / Double(targetTemperature)))
                if (interpolatedSpeed < minSpeed) {
                    interpolatedSpeed = 0
                }
                if (interpolatedSpeed > maxSpeed) {
                    interpolatedSpeed = maxSpeed
                }
                setFanSpeed(fan.id, Int(interpolatedSpeed))
            }
        }
        catch {
            print("Failed fan controller update")
        }
    }
}
