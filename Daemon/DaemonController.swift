import Foundation

@objc class DaemonController: NSObject, CommunicationContract {
  func ping() -> String {
    return "Hello there!"
  }
  
//  func toGreenString(_ text: String, withReply reply: @escaping (String) -> Void) {
//    reply("\u{1B}[32m\(text)\u{1B}[0m")
//  }
}
