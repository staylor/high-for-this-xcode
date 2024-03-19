import SwiftUI
import HighForThisAPI

struct ShowDetail: View {
    var id: ObjID
    @State private var loading = false
    @State private var show: ShowData?
    
    var body: some View {
        VStack(alignment: .leading) {
            if (loading) {
                Loading()
            } else if (show != nil) {
                let venue = show!.venue.asVenue!
                let artist = show!.artist.asArtist!
                ScrollView {
                    if let artwork = artist.appleMusic?.artwork {
                        ShowArtistArtwork(artwork: artwork)
                    }
                    VStack(alignment: .leading) {
                        Text(parseDate(show!.date / 1000)).foregroundColor(.black).font(.title3).fontWeight(.bold)
                        Spacer()
                        NavigationLink {
                            ArtistShows(name: show!.artist.name, slug: show!.artist.slug)
                        } label: {
                            Text(show!.artist.name).foregroundColor(.pink).font(.title)
                        }
                        Spacer()
                        NavigationLink {
                            VenueShows(name: show!.venue.name, slug: show!.venue.slug)
                        } label: {
                            Text(show!.venue.name).foregroundColor(.black).font(.title2)
                        }
                        if let address = venue.address {
                            Text(address).foregroundColor(.gray)
                        }
                    }.frame(maxWidth: .infinity, alignment: .leading).padding()
                    if let coordinates = venue.coordinates {
                      MapView(name: show!.venue.name, coordinates: coordinates)
                    }
                }
            }
            Spacer()
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
