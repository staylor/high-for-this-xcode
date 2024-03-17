import SwiftUI
import HighForThisAPI

struct ShowGroup: Identifiable {
    var id = UUID()
    var date: Double
    var shows: [HighForThisAPI.ShowsQuery.Data.Shows.Edge.Node]
    
    func dateFormatted() -> String {
        return parseDate(date / 1000)
    }
}
