import SwiftUI

struct ShowGroup: Identifiable {
    var id = UUID()
    var date: String
    var shows: [Show]
    
    func dateFormatted() -> String {
        return parseDate(date)
    }
}
