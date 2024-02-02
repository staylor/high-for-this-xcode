import SwiftUI
import MapKit

struct MapView: View {
    var name: String
    var coordinates: Coordinates
    @State private var orientation = UIDevice.current.orientation

    var body: some View {
        let coords = CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
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

#Preview {
    MapView(name: shows[0].venue.name, coordinates: shows[0].venue.coordinates)
}
