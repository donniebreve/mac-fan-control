import Cocoa

class StatusBarController {
    private var statusBar: NSStatusBar
    private var statusItem: NSStatusItem
    
    init() {
        statusBar = NSStatusBar.init()
        statusItem = statusBar.statusItem(withLength: NSStatusItem.variableLength)
        if let statusBarButton = statusItem.button {
            statusBarButton.title = "mfc"
        }
    }
    
    func setText(_ text:String) {
        statusItem.button!.title = text;
    }
}
