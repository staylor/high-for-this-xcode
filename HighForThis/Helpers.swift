import Foundation
import CoreLocation

func parseDate(str: String) -> String {
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
