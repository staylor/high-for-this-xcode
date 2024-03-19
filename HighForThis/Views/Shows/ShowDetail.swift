import SwiftUI
import HighForThisAPI

struct ShowDetail: View {
    var id: ObjID
    @State private var loading = false
    @State private var show: ShowData?
    
    var body: some View {
        VStack {
            if (loading) {
                Loading()
            } else if (show != nil) {
                let venue = show!.venue.asVenue!
                let artist = show!.artist.asArtist!
                ScrollView {
                    VStack(alignment: .leading) {
                        if let artwork = artist.appleMusic!.artwork {
                            ShowArtistArtwork(artwork: artwork)
                        }
                        ShowDetailText(show: show!).padding()
                    }
                    if let coordinates = venue.coordinates {
                      MapView(name: show!.venue.name, coordinates: coordinates)
                    }
                }
            }
        }
        .onAppear() {
            getShow(id: id) { show in
                self.show = show
                self.loading = false
            }
        }
    }
}

#Preview {
    NavigationView {
        ShowDetail(id: PREVIEW_SHOW_ID)
    }
    // color of back button
    .accentColor(.pink)
}
