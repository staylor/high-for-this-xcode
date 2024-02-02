
import SwiftUI

struct PodcastList: View {
    var body: some View {
        VStack(alignment: .leading) {
            NavigationSplitView {
                List {
                    ForEach(podcasts) { podcast in
                        NavigationLink {
                            Text(podcast.title)
                        } label: {
                            Text(podcast.title)
                        }
                    }
                }.navigationTitle("Episodes")
            } detail: {
                ShowDetail(show: shows[0])
            // Back button text color
            }
            .accentColor(.pink)
        }
    }
}

#Preview {
    PodcastList()
}
