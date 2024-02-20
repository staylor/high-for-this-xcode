import SwiftUI
import MapKit

struct ShowDetailText: View {
    var show: Show

    var body: some View {
        VStack(alignment: .leading) {
            Text(show.dateFormatted()).foregroundColor(.black).font(.title2).fontWeight(.bold)
            Text(show.artist.name).foregroundColor(.pink).font(.title)
            Text(show.venue.name).foregroundColor(.gray)
            Text(show.venue.address).foregroundColor(.gray)
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    ShowDetailText(show: static_shows[0])
}
