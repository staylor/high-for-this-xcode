import Foundation
import CoreLocation

func parseDate(str: String) -> String {
    if str == "" {
        return ""
    }
    
    let reader = DateFormatter()
    reader.dateFormat = "yyyy-MM-dd"
    let date = reader.date(from: str)
    
    let writer = DateFormatter()
    writer.dateFormat = "MM/dd/yyyy"
    
    return writer.string(from: date!)
}

func parseLocation(address: String, completion: @escaping (_ location: CLLocationCoordinate2D?)-> Void) {
    let geocoder = CLGeocoder()
    geocoder.geocodeAddressString(address) {
        placemarks, error in
        guard let placemarks = placemarks,
        let location = placemarks.first?.location?.coordinate else {
            completion(nil)
            return
        }
        completion(location)
    }
}
