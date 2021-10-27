import Cocoa
import SwiftUI

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    private var window: NSWindow!
    private var statusBarController: StatusBarController!
    private var temperatureController: TemperatureController!
    private var fanController: FanController!
    private var timer: Timer!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Start SMC
        self.initializeSmc()
        
        // Create controllers
        statusBarController = StatusBarController.init()
        temperatureController = TemperatureController.init()
        fanController = FanController.init()
        fanController.printInformation()
        
        // Start the internal timer
        timer = Timer(timeInterval: 1.0, target: self, selector: #selector(timerCallback), userInfo: nil, repeats: true)
        timer.tolerance = 0.5
        RunLoop.current.add(timer, forMode: RunLoop.Mode.common)
    }
    
    func initializeSmc() {
        do {
            try SMCKit.open()
        }
        catch SMCKit.SMCError.failedToOpen {
            print("Failed to open SMC")
            return
        }
        catch SMCKit.SMCError.unknown(let ioReturn, _) {
            print(IOKitHelper.getIOReturnDescription(ioReturn))
            return
        }
        catch {
            print("Unknown SMC error")
            return
        }
    }
    
    func showPreferencesWindow() {
        // Create the window and set the content view.
        let contentView = ContentView()
        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered, defer: false)
        window.isReleasedWhenClosed = false
        window.center()
        window.setFrameAutosaveName("Main Window")
        window.contentView = NSHostingView(rootView: contentView)
        window.makeKeyAndOrderFront(nil)
    }
    
    @objc
    func timerCallback() {
        let temp = temperatureController.getAverageTemperature()
        let speed = fanController.getFanSpeed(0)
        statusBarController.setText("Temp \(temp), Speed: \(speed)")
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
}
