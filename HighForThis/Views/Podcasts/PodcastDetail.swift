import SwiftUI
import AVKit

struct PodcastDetail: View {
    var podcast: PodcastEpisode
    @StateObject private var viewModel = AudioPlayerViewModel()

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image(systemName: "waveform")
                    .resizable()
                    .frame(width: 80, height: 80)
                detailText
                playButton
            }.padding()
        }
    }
    
    var detailText: some View {
        VStack(alignment: .leading) {
            Text(podcast.title).foregroundColor(.black).font(.title2).fontWeight(.bold).padding(.vertical)
            Text(podcast.description).padding(.bottom)
        }
    }
    
    var playButton: some View {
        HStack {
            Button(action: {
                viewModel.toggle(url: podcast.audio)
            }) {
                Image(systemName: viewModel.isPlaying ? "pause.circle.fill" : "play.circle.fill").resizable()
                    .foregroundColor(.pink)
                    .frame(width: 50, height: 50)
                    .aspectRatio(contentMode: .fit)
            }
        }.padding(.trailing)
    }
}

#Preview {
    PodcastDetail(podcast: StaticData.podcasts()[0])
}
