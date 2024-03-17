import SwiftUI

struct Show: Hashable, Codable, Identifiable {
    var id: Int
    var artist: Performer
    var venue: Venue
    var date: Double
    
    func dateFormatted() -> String {
        return parseDate(date)
    }
}
