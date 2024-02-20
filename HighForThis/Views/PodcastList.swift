import SwiftUI

struct PodcastList: View {
    @State var loading = false
    @State var podcasts = [PodcastEpisode]()

    var body: some View {
        VStack(alignment: .leading) {
            if loading {
                Loading()
            } else if podcasts.count == 0 {
                Text("No podcast episodes.")
            } else {
                NavigationSplitView {
                    List {
                        ForEach(podcasts) { podcast in
                            NavigationLink {
                                PodcastDetail(podcast: podcast)
                            } label: {
                                HStack {
                                    Image(systemName: "waveform")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                    Text(podcast.title)
                                }
                            }
                        }
                    }.navigationTitle("Podcast Episodes")
                } detail: {
                    // iPad initial view
                    PodcastDetail(podcast: podcasts[0])
                }
                // Back button text color
                .accentColor(.pink)
            }
        }.onAppear() {
            loading = true
            loadJsonUrl(url: PODCASTS_URL) { (podcasts) in
                self.podcasts = podcasts
                self.loading = false
            }
        }
    }
}

#Preview {
    PodcastList()
}
