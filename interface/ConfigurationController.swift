import Cocoa
import Foundation
import IOKit.hid

class ConfigurationController {
    public var fontFamily: String
    public var fontSize: Float
    public var showTemperature: Bool!
    public var showFanSpeed: Bool!
    public var temperatureTargets: Array<(Int, Int)>!

    init() {
        fontFamily = "Monaco"
        fontSize = 10
        let home = FileManager.default.homeDirectory(forUser: "don")
        let configFile = home!
            .appendingPathComponent(".config")
            .appendingPathComponent("mac-fan-curve")
            .appendingPathComponent("mac-fan-curve")
            .appendingPathExtension("conf")
        guard FileManager.default.fileExists(atPath: configFile.path) else {
            preconditionFailure("Config file expected at \(configFile.absoluteString) was not found.")
        }
        temperatureTargets = Array<(Int, Int)>()
        let configFileContents = try! String(contentsOfFile: configFile.path)
        let configLines = configFileContents.split(separator: "\n")
        var section: Int = 0
        for fileLine in configLines {
            let line = trimString(fileLine)
            // Ignore comments or empty line
            if (isCommentOrEmpty(line)) { continue; }
            // Check for section
            if (line == "[Display]") {
                section = 1
                continue
            }
            if (line == "[Curve]") {
                section = 2
                continue
            }
            // Read configurations
            switch (section)
            {
                case 1: // Display
                    let tokens = line.split(separator: "=")
                    if (tokens[0] == "FontFamily") {
                        fontFamily = String(tokens[1])
                    }
                    if (tokens[0] == "FontSize") {
                        fontSize = Float(tokens[1])!
                    }
                    if (tokens[0] == "ShowTemperature") {
                        showTemperature = true
                    }
                    if (tokens[0] == "ShowFanSpeed") {
                        showFanSpeed = true
                    }
                    break;

                case 2: // Curve
                    let tokens = line.split(separator: "=")
                    let subTokens = tokens[1].trimmingCharacters(in: CharacterSet(charactersIn: "()")).split(separator: ",")
                    let temperature = Int(subTokens[0])!
                    let percentage = Int(subTokens[1])!
                    temperatureTargets.append((temperature, percentage))
                    break
                
                default:
                    break
            }
        }
    }
    
    func trimString(_ line: Substring) -> String {
        var trimmedLine = line.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let commentIndex = trimmedLine.firstIndex(of: "#")
        if (commentIndex != nil) {
            trimmedLine = String(trimmedLine[...commentIndex!])
        }
        return trimmedLine
    }
    
    func isCommentOrEmpty(_ line: String) -> Bool {
        return line.isEmpty || line.starts(with: "#");
    }
}
