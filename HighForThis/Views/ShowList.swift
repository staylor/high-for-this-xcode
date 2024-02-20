import SwiftUI

struct ShowList: View {
    @State private var shows: [Show] = []

    var body: some View {
        VStack(alignment: .leading) {
            if shows.count == 0 {
                Text("No recommended shows.")
            } else {
                NavigationSplitView {
                    List {
                        ForEach(showGroups()) { group in
                            Section {
                                ForEach(group.shows) { show in
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
            loadJsonUrl(url: SHOWS_URL) { (shows) in
                self.shows = shows
            }
        }
    }
    
    func showGroups() -> [ShowGroup] {
        var dict: [String:ShowGroup] = [:]
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
