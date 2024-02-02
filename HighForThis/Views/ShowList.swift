import SwiftUI

struct ShowList: View {
    var preview = false

    var body: some View {
        let groups = showGroups()
        
        VStack(alignment: .leading) {
            NavigationSplitView {
                List {
                    ForEach(groups) { group in
                        Section {
                            ForEach(group.shows) { show in
                                NavigationLink {
                                    ShowDetail(preview: preview, show: show)
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
    ShowList(preview: true)
}
