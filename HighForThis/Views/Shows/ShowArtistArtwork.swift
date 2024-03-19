import SwiftUI
import HighForThisAPI

struct ShowArtistArtwork: View {
    var artwork: HighForThisAPI.ShowQuery.Data.Show.Artist.AsArtist.AppleMusic.Artwork
    
    var body: some View {
        let regex = /\{[wh]\}/
        let resized = artwork.url!.replacing(regex, with: String(artwork.width!))
        AsyncImage(url: URL(string: resized)) { phase in
            switch phase {
            case .empty:
                HStack(alignment: .center) {
                    Spacer()
                    ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .pink)).scaleEffect(2)
                    Spacer()
                }.frame(width: .infinity, height: 392)
            case .success(let image):
                image.resizable()
                    .aspectRatio(contentMode: .fit)
            case .failure:
                Image(systemName: "photo")
                
            @unknown default:
                // Since the AsyncImagePhase enum isn't frozen,
                // we need to add this currently unused fallback
                // to handle any new cases that might be added
                // in the future:
                EmptyView()
            }
        }
    }
}
