import SwiftUI
import MapKit

struct ShowDetail: View {
    @State var location: CLLocationCoordinate2D?
    
    var show: Show

    var body: some View {
        ScrollView {
            MapView(name: show.venue.name, coordinates: show.venue.coordinates)
            VStack(alignment: .leading) {
                Text(show.dateFormatted()).foregroundColor(.black).font(.title2).fontWeight(.bold)
                Text(show.name).foregroundColor(.pink).font(.title).padding(.top)
                Text(show.venue.name).foregroundColor(.gray).font(.title2)
                Text(show.venue.address).foregroundColor(.gray)
            }.frame(maxWidth: .infinity, alignment: .leading).padding()
        }
    }
    
}

#Preview {
    ShowDetail(show: shows[0])
}
