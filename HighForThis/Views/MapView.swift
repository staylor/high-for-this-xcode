import SwiftUI
import MapKit
import HighForThisAPI

struct MapView: View {
    var name: String
    var coordinates: ShowsQuery.Data.Shows.Edge.Node.Venue.AsVenue.Coordinates
    @State private var orientation = UIDevice.current.orientation

    var body: some View {
        let coords = CLLocationCoordinate2D(latitude: coordinates.latitude!, longitude: coordinates.longitude!)
        let region = MKCoordinateRegion(
            center: coords,
            span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        )
        Map(initialPosition: .region(region)) {
            Marker(name, systemImage: "music.note.house.fill", coordinate: coords)
        }
        .frame(height: orientation.isPortrait || !orientation.isValidInterfaceOrientation ? 300 : .infinity)
        .mapStyle(.standard(elevation: .automatic))
        .mapControlVisibility(.visible)
        .detectOrientation($orientation)
    }
}

//struct MapView_Previews: PreviewProvider {
//    static var previews: some View {
//        let show = StaticData.shows()[0]
//        MapView(name: show.venue.name, coordinates: show.venue.coordinates)
//    }
//}
