import SwiftUI
import MapKit
import HighForThisAPI

struct ShowDetail: View {
    var show: HighForThisAPI.ShowsQuery.Data.Shows.Edge.Node
    @State private var orientation = UIDevice.current.orientation
    
    var body: some View {
        VStack {
            let venue = show.venue.asVenue!
            let artist = show.artist.asArtist!
            if orientation.isLandscape {
                HStack {
                  if let coordinates = venue.coordinates {
                    MapView(name: show.venue.name, coordinates: coordinates)
                  }
                  ShowDetailText(show: show)
                }
            } else {
                ScrollView {
                    if let coordinates = venue.coordinates {
                      MapView(name: show.venue.name, coordinates: coordinates)
                    }
                    HStack(alignment: .top) {
                        if let artwork = artist.appleMusic!.artwork!.url {
                            let resized = artwork.replacingOccurrences(of: "{w}", with: "100").replacingOccurrences(of: "{h}", with: "100")
                            AsyncImage(url: URL(string: resized)).padding(.horizontal)
                        } else {
                            ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .pink))
                                .frame(width: 100, height: 100)
                                .padding(.horizontal)
                        }
                        ShowDetailText(show: show)
                    }.padding(.vertical)
                }
            }
        }.detectOrientation($orientation)
    }
}
