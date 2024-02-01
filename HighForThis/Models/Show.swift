import SwiftUI

struct Show: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var venue: String
    var date: String
    
    func dateFormatted() -> String {
        return parseDate(str: date)
    }
}
