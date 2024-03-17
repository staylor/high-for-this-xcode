import SwiftUI
import MapKit
import HighForThisAPI

struct ShowDetailText: View {
    var show: HighForThisAPI.ShowsQuery.Data.Shows.Edge.Node

    var body: some View {
        let venue = show.venue.asVenue!
        VStack(alignment: .leading) {
            Text(parseDate(show.date / 1000)).foregroundColor(.black).font(.title2).fontWeight(.bold)
            Text(show.artist.name).foregroundColor(.pink).font(.title)
            Text(show.venue.name).foregroundColor(.gray)
            if let address = venue.address {
                Text(address).foregroundColor(.gray)
            }
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

//#Preview {
//    ShowDetailText(show: StaticData.shows()[0])
//}
