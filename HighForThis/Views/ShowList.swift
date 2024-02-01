import Foundation
import SwiftUI

struct ShowList: View {
    var body: some View {
        let groups = showGroups()
        
        VStack {
            Text("Recommended Shows").font(.title).padding()
            NavigationSplitView {
                List {
                    ForEach(groups) { group in
                        Section {
                            ForEach(group.shows) { show in
                                NavigationLink {
                                    ShowRow(show: show)
                                } label: {
                                    ShowRow(show: show)
                                }
                            }
                        } header: {
                            Text(group.dateFormatted()).foregroundColor(.black).fontWeight(.heavy)
                        }
                    }
                }
                .listStyle(InsetListStyle())
            } detail: {
                Text("Select a show")
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
