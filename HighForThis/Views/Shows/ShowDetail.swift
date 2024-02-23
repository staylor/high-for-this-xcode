import SwiftUI
import MapKit
import MusicKit

struct ShowDetail: View {
    var show: Show
    @State private var artistArtwork: Artwork? = nil
    @State private var orientation = UIDevice.current.orientation
    
    var body: some View {
        VStack {
            if orientation.isLandscape {
                HStack {
                    MapView(name: show.venue.name, coordinates: show.venue.coordinates)
                    ShowDetailText(show: show)
                }
            } else {
                ScrollView {
                    MapView(name: show.venue.name, coordinates: show.venue.coordinates)
                    HStack(alignment: .top) {
                        if isPreview {
                            Image("sample_artist").resizable().frame(width: 100, height: 100).padding(.horizontal)
                        } else if let artwork = artistArtwork {
                            ArtworkImage(artwork, height: 100).padding(.horizontal)
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
            .onAppear(perform: artwork)
    }
    
    private func artwork() {
        if isPreview {
            return
        }
        
        Task {
            do {
                let id = MusicItemID(show.artist.appleMusicId)
                let request = MusicCatalogResourceRequest<MusicKit.Artist>(matching: \.id, equalTo: id)
                let response = try await request.response()
                guard let artist = response.items.first else { return }
                artistArtwork = artist.artwork!
            } catch {
                print("Error retrieving artwork: \(error.localizedDescription)")
            }
        }
    }
}

#Preview {
    ShowDetail(show: StaticData.shows()[0])
}
