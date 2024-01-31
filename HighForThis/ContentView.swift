//
//  ContentView.swift
//  HighForThis
//
//  Created by Scott Taylor on 1/31/24.
//

import SwiftUI

struct ShowGroup: Identifiable {
    var id = UUID()
    var date: String
    var shows: [Show]
}

struct Show: Identifiable {
    var id = UUID()
    var name: String
    var venue: String
    var date: String
}

struct ContentView: View {
    @State var shows = [
        Show(name: "Band of Horses", venue: "The Capitol Theatre", date: "2024-02-02"),
        Show(name: "Lucius", venue: "Brooklyn Steel", date: "2024-02-03"),
        Show(name: "Portugal. The Man.", venue: "The Capitol Theatre", date: "2024-02-18"),
        Show(name: "Zach Bryan", venue: "Prudential Center", date: "2024-02-18"),
        Show(name: "Drake", venue: "UBS Arena", date: "2024-02-18")
    ]
    
    var body: some View {
        let groups = showGroups()
        
        VStack {
            List {
                ForEach(groups) { group in
                    Section(header: Text(group.date)) {
                        ForEach(group.shows) { show in
                            VStack(alignment: .leading) {
                                Text(show.name)
                                Text(show.venue)
                            }
                        }
                    }
                }
            }
            .listStyle(InsetListStyle())
            Button("Add Show") {
                shows.append(Show(name: "New Show", venue: "", date: ""))
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
    ContentView()
}
