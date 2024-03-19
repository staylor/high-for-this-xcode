import SwiftUI
import HighForThisAPI

struct ArtistShows: View {
    var name: String
    var slug: String
    
    var body: some View {
        VStack(alignment: .leading) {
            ShowList(title: name, artistSlug: slug)
        }
    }
}
