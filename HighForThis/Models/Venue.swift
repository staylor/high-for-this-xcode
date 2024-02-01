import SwiftUI
import CoreLocation

struct Coordinates: Hashable, Codable {
    var latitude: CLLocationDegrees
    var longitude: CLLocationDegrees
}

struct Venue: Hashable, Codable {
    var name: String
    var address: String
    var coordinates: Coordinates
}
