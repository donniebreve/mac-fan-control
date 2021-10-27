import Cocoa
import Foundation
import IOKit.hid

class FanController {
    private var fans:[Fan]

    init() {
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
    
    func getFanSpeed(_ id:Int) -> Int{
        do {
            return try SMCKit.fanCurrentSpeed(id)
        }
        catch {
            print("Failed to get fan speed")
            return 0
        }
    }
}
