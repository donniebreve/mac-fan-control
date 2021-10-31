import Cocoa
import Foundation

class TemperatureController {

    init() {
        do {
            let sensors = try SMCKit.allKnownTemperatureSensors()
//            for sensor in sensors {
//                print("[name:\(sensor.name), code: \(sensor.code.toString())]")
//            }
//            let usensors = try SMCKit.allUnknownTemperatureSensors()
//            for sensor in usensors {
//                print("[name:\(sensor.name), code: \(sensor.code.toString())]")
//            }
        }
        catch {
            print("Failure")
        }
    }
    
    func getAverageTemperature() -> Int {
        do {
            return try Int(SMCKit.temperature(FourCharCode(fromString: "TC2C")))
        }
        catch {
            print("Failed to get temperature")
            return 0
        }
    }
}
