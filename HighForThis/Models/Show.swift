import SwiftUI

struct Show: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var venue: Venue
    var date: String
    
    func dateFormatted() -> String {
        return parseDate(str: date)
    }
}
