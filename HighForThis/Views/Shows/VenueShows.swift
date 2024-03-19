import SwiftUI
import HighForThisAPI

struct VenueShows: View {
    var name: String
    var slug: String
    
    var body: some View {
        VStack(alignment: .leading) {
            ShowList(title: name, venueSlug: slug)
        }
    }
}
