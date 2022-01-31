import Foundation

let label: String = "com.donniebreve.mac-fan-curve-daemon"

@objc(CommunicationContract) protocol CommunicationContract {
  func ping() -> String
  
  // why is the reply an argument?
//  func toGreenString(_ text: String, withReply reply: @escaping (String) -> Void)
}
