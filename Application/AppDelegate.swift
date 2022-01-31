import Cocoa
import SwiftUI

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    @IBOutlet weak var menu: NSMenu!
    
    private var aboutWindow: NSWindow!
    private var configurationController: ConfigurationController!
    private var statusBarController: StatusBarController!
//    private var temperatureController: TemperatureController!
//    private var fanController: FanController!
    private var timer: Timer!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Start SMC
        self.initializeSmc()
        // Create controllers
        configurationController = ConfigurationController.init()
        statusBarController = StatusBarController.init(menu, configurationController)
//        temperatureController = TemperatureController.init()
//        fanController = FanController.init(configurationController)
//        fanController.printInformation()
        // Create GUI components
        createAboutWindow()
        // Start the internal timer
        timer = Timer(timeInterval: 1.0, target: self, selector: #selector(timerCallback), userInfo: nil, repeats: true)
        timer.tolerance = 0.5
        RunLoop.current.add(timer, forMode: RunLoop.Mode.common)
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        //fanController.setFansAuto(true)
        //SMCKit.close()
    }
    
    func createAboutWindow() {
        aboutWindow = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered, defer: false)
        aboutWindow.isReleasedWhenClosed = false
        aboutWindow.setFrameAutosaveName("About")
        aboutWindow.contentView = NSHostingView(rootView: AboutView())
    }
    
    @IBAction func about(sender: AnyObject) {
        aboutWindow.orderFrontRegardless()
    }
    
    func initializeSmc() {
//        do {
//            try SMCKit.open()
//        }
//        catch SMCKit.SMCError.failedToOpen {
//            print("Failed to open SMC")
//            return
//        }
//        catch SMCKit.SMCError.unknown(let ioReturn, _) {
//            print(IOKitHelper.getIOReturnDescription(ioReturn))
//            return
//        }
//        catch {
//            print("Unknown SMC error")
//            return
//        }
    }
    
    @objc
    func timerCallback() {
//        let temperature = temperatureController.getAverageTemperature()
//        if (configurationController.fanControlEnabled)
//        {
//            fanController.update(temperature)
//        }
//        statusBarController.setTemperature(temperature)
//        statusBarController.setSpeed(fanController.getFanSpeed(0))
        statusBarController.update()
    }
}
