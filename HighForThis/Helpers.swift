import Foundation
import CoreLocation

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
