import SwiftUI
import MapKit

struct ShowDetailText: View {
    var show: ShowData

    var body: some View {
        let venue = show.venue.asVenue!
        VStack(alignment: .leading) {
            Text(parseDate(show.date / 1000)).foregroundColor(.black).font(.title2).fontWeight(.bold)
            NavigationLink {
              Text("This is the artist page!")
            } label: {
              Text(show.artist.name).foregroundColor(.pink).font(.title)
            }
            NavigationLink {
                Text("This is the venue page!")
            } label: {
                Text(show.venue.name).foregroundColor(.gray)
            }
            if let address = venue.address {
                Text(address).foregroundColor(.gray)
            }
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

//#Preview {
//    ShowDetailText(show: StaticData.shows()[0])
//}
