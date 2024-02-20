import Foundation
import CoreLocation

var isPreview: Bool {
    return ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
}

func parseDate(_ str: String) -> String {
    if str == "" {
        return ""
    }
    
    let reader = DateFormatter()
    reader.dateFormat = "yyyy-MM-dd"
    let date = reader.date(from: str)
    
    let writer = DateFormatter()
    writer.dateFormat = "MM/dd/yyyy"
    
    return writer.string(from: date!)
}

func cdnUrl(_ path: String) -> String {
    return "https://storage.googleapis.com/wonderboymusic/\(path)"
}
