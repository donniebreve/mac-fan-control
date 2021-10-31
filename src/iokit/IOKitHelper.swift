import IOKit
import Foundation

public struct IOKitHelper {
    public static func getIOReturnDescription(_ value: IOReturn) -> String {
        switch (value) {
            case kIOReturnAborted: return "Operation aborted"
            case kIOReturnBadArgument: return "Invalid argument"
            case kIOReturnBadMedia: return "Media error"
            case kIOReturnBadMessageID: return "Sent/received messages had different msg_id"
            case kIOReturnBusy: return "Device busy"
            case kIOReturnCannotLock: return "Can't acquire lock"
            case kIOReturnCannotWire: return "Can't wire down physical memory"
            case kIOReturnDMAError: return "DMA failure"
            case kIOReturnDeviceError: return "The device is not working properly"
            case kIOReturnError: return "General error"
            case kIOReturnExclusiveAccess: return "Exclusive access and device already open"
            case kIOReturnIOError: return "General I/O error"
            case kIOReturnIPCError: return "Error during IPC"
            case kIOReturnInternalError: return "Internal error"
            case kIOReturnInvalid: return "Should never be seen"
            case kIOReturnIsoTooNew: return "Isochronous I/O request for distant future"
            case kIOReturnIsoTooOld: return "Isochronous I/O request for distant past"
            case kIOReturnLockedRead: return "Device read locked"
            case kIOReturnLockedWrite: return "Device write locked"
            case kIOReturnMessageTooLarge: return "Oversized msg received on interrupt port"
            case kIOReturnNoBandwidth: return "Bus bandwidth would be exceeded"
            case kIOReturnNoChannels: return "No DMA channels left"
            case kIOReturnNoCompletion: return "A completion routine is required"
            case kIOReturnNoDevice: return "No such device"
            case kIOReturnNoFrames: return "No DMA frames enqueued"
            case kIOReturnNoInterrupt: return "No interrupt attached"
            case kIOReturnNoMedia: return "Media not present"
            case kIOReturnNoMemory: return "Can't allocate memory"
            case kIOReturnNoPower: return "No power to device"
            case kIOReturnNoResources: return "Resource shortage"
            case kIOReturnNoSpace: return "No space for data"
            case kIOReturnNotAligned: return "Alignment error"
            case kIOReturnNotAttached: return "Device not attached"
            case kIOReturnNotFound: return "Data was not found"
            case kIOReturnNotOpen: return "Device not open"
            case kIOReturnNotPermitted: return "Not permitted"
            case kIOReturnNotPrivileged: return "Privilege violation"
            case kIOReturnNotReadable: return "Read not supported"
            case kIOReturnNotReady: return "Not ready"
            case kIOReturnNotResponding: return "Device not responding"
            case kIOReturnNotWritable: return "Write not supported"
            case kIOReturnOffline: return "Device offline"
            case kIOReturnOverrun: return "Data overrun"
            case kIOReturnPortExists: return "Port already exists"
            case kIOReturnRLDError: return "RLD failure"
            case kIOReturnStillOpen: return "Device(s) still open"
            case kIOReturnTimeout: return "I/O timeout"
            case kIOReturnUnderrun: return "Data underrun"
            case kIOReturnUnformattedMedia: return "media not formatted"
            case kIOReturnUnsupported: return "Unsupported function"
            case kIOReturnUnsupportedMode: return "No such mode"
            case kIOReturnVMError: return "Misc. VM failure"
            case kIOReturnError: return "General error"
            case kIOReturnNoMemory: return "Can't allocate memory"
            case kIOReturnNoResources: return "Resource shortage"
            case kIOReturnIPCError: return "Error during IPC"
            case kIOReturnNoDevice: return "No such device"
            case kIOReturnNotPrivileged: return "Privilege violation"
            case kIOReturnBadArgument: return "Invalid argument"
            case kIOReturnLockedRead: return "Device read locked"
            case kIOReturnLockedWrite: return "Device write locked"
            case kIOReturnExclusiveAccess: return "Exclusive access and device already open"
            case kIOReturnBadMessageID: return "Sent/received messages had different msg_id"
            case kIOReturnUnsupported: return "Unsupported function"
            case kIOReturnVMError: return "Misc. VM failure"
            case kIOReturnInternalError: return "Internal error"
            case kIOReturnIOError: return "General I/O error"
            case kIOReturnCannotLock: return "Can't acquire lock"
            case kIOReturnNotOpen: return "Device not open"
            case kIOReturnNotReadable: return "Read not supported"
            case kIOReturnNotWritable: return "Write not supported"
            case kIOReturnNotAligned: return "Alignment error"
            case kIOReturnBadMedia: return "Media error"
            case kIOReturnStillOpen: return "Device(s) still open"
            case kIOReturnRLDError: return "RLD failure"
            case kIOReturnDMAError: return "DMA failure"
            case kIOReturnBusy: return "Device busy"
            case kIOReturnTimeout: return "I/O timeout"
            case kIOReturnOffline: return "Device offline"
            case kIOReturnNotReady: return "Not ready"
            case kIOReturnNotAttached: return "Device not attached"
            case kIOReturnNoChannels: return "No DMA channels left"
            case kIOReturnNoSpace: return "No space for data"
            case kIOReturnPortExists: return "Port already exists"
            case kIOReturnCannotWire: return "Can't wire down physical memory"
            case kIOReturnNoInterrupt: return "No interrupt attached"
            case kIOReturnNoFrames: return "No DMA frames enqueued"
            case kIOReturnMessageTooLarge: return "Oversized msg received on interrupt port"
            case kIOReturnNotPermitted: return "Not permitted"
            case kIOReturnNoPower: return "No power to device"
            case kIOReturnNoMedia: return "Media not present"
            case kIOReturnUnformattedMedia: return "media not formatted"
            case kIOReturnUnsupportedMode: return "No such mode"
            case kIOReturnUnderrun: return "Data underrun"
            case kIOReturnOverrun: return "Data overrun"
            case kIOReturnDeviceError: return "The device is not working properly"
            case kIOReturnNoCompletion: return "A completion routine is required"
            case kIOReturnAborted: return "Operation aborted"
            case kIOReturnNoBandwidth: return "Bus bandwidth would be exceeded"
            case kIOReturnNotResponding: return "Device not responding"
            case kIOReturnIsoTooOld: return "Isochronous I/O request for distant past"
            case kIOReturnIsoTooNew: return "Isochronous I/O request for distant future"
            case kIOReturnNotFound: return "Data was not found"
            case kIOReturnInvalid: return "Should never be seen"
            default: return "Unknown"
        }
    }
}
