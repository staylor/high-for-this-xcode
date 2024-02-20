import SwiftUI
import AVKit

struct PodcastDetail: View {
    var preview = false
    var podcast: PodcastEpisode
    @StateObject private var viewModel = AudioPlayerViewModel()
    @State private var orientation = UIDevice.current.orientation

    var body: some View {
        VStack {
            if orientation.isLandscape {
                HStack {
                    Text("horizontal")
                }
            } else {
                ScrollView {
                    VStack(alignment: .leading) {
                        Image(systemName: "waveform")
                            .resizable()
                            .frame(width: 80, height: 80)
                        Text(podcast.title).foregroundColor(.black).font(.title2).fontWeight(.bold).padding(.vertical)
                        Text(podcast.description).padding(.bottom)
                        HStack {
                            Button(action: {
                                viewModel.toggle(url: podcast.audio)
                            }) {
                                Image(systemName: viewModel.isPlaying ? "pause.circle.fill" : "play.circle.fill").resizable()
                                    .foregroundColor(.pink)
                                    .frame(width: 50, height: 50)
                                    .aspectRatio(contentMode: .fit)
                            }
                        }
                    }.padding()
                }
            }
        }
    }
}

#Preview {
    PodcastDetail(podcast: static_podcasts[0])
}
