import Foundation

// Thanks to Derik: https://www.rderik.com/blog/creating-a-launch-agent-that-provides-an-xpc-service-on-macos/
let delegate = ServiceDelegate()
let listener = NSXPCListener(machServiceName: label)
listener.delegate = delegate;
listener.resume()
RunLoop.main.run()

class ServiceDelegate : NSObject, NSXPCListenerDelegate {
    func listener(_ listener: NSXPCListener, shouldAcceptNewConnection connection: NSXPCConnection) -> Bool {
        let exportedObject = ConsoleSequencerXPC()
        connection.exportedInterface = NSXPCInterface(with: ConsoleSequencerXPCProtocol.self)
        connection.exportedObject = exportedObject
        connection.resume()
        return true
    }
}
