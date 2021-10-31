import Cocoa

class StatusBarController {
    private var configurationController: ConfigurationController
    private var statusItem: NSStatusItem
    private var statusBarButton: NSStatusBarButton
    private var temperature: Int = 0
    private var speed: Int = 0
    
    init(_ menu: NSMenu, _ configurationController: ConfigurationController) {
        self.configurationController = configurationController
        statusItem = NSStatusBar.system.statusItem(withLength: -1)
        statusItem.menu = menu
        statusBarButton = statusItem.button!
        statusBarButton.font = NSFont(
            name: configurationController.fontFamily,
            size: CGFloat(configurationController.fontSize))
    }
    
    func setTemperature(_ temperature: Int) {
        self.temperature = temperature
    }
    
    func setSpeed(_ speed: Int) {
        self.speed = speed
    }
    
    func update() {
        var text: String = ""
        if (configurationController.showTemperature) {
            text.append("\(self.temperature)°C")
        }
        if (configurationController.showFanSpeed) {
            //text.append("  \(String(format: "%.1f", Double(self.speed)/1000))K RPM")
            text.append("  \(String(self.speed))RPM")
        }
        statusItem.button!.title = text;
    }
}
