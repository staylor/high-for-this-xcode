import SwiftUI
import HighForThisAPI

struct ShowList: View {
    @State private var loading = false
    @State private var shows: [HighForThisAPI.ShowsQuery.Data.Shows.Edge.Node] = []

    var body: some View {
        VStack(alignment: .leading) {
            if (loading) {
                Loading()
            } else if shows.count == 0 {
                Text("No recommended shows.")
            } else {
                NavigationSplitView {
                    List {
                        ForEach(showGroups()) { group in
                            Section {
                                ForEach(group.shows, id: \.id) { show in
                                    NavigationLink {
                                        ShowDetail(show: show)
                                    } label: {
                                        ShowRow(show: show)
                                    }
                                }
                            } header: {
                                Text(group.dateFormatted()).foregroundColor(.black).fontWeight(.heavy)
                            }
                        }
                    }.navigationTitle("Recommended")
                } detail: {
                    ShowDetail(show: shows[0])
                    // Back button text color
                }
                .accentColor(.pink)
            }
        }.onAppear() {
            let query = HighForThisAPI.ShowsQuery()
            apolloClient.fetch(query: query) { result in
              guard let data = try? result.get().data else { return }
                var nodes: [HighForThisAPI.ShowsQuery.Data.Shows.Edge.Node] = []
                for edge in data.shows!.edges {
                    nodes.append(edge.node)
                }
                self.shows = nodes
                self.loading = false
            }
        }
    }
    
    func showGroups() -> [ShowGroup] {
        var dict: [Double:ShowGroup] = [:]
        for show in shows {
            if dict[show.date] == nil {
                dict[show.date] = ShowGroup(date: show.date, shows: []);
            }
            dict[show.date]!.shows.append(show)
        }
        let sortedKeys = dict.keys.sorted()
        var byDate: [ShowGroup] = []
        for key in sortedKeys {
            byDate.append(dict[key]!)
        }
        return byDate
    }
}

#Preview {
    ShowList()
}
