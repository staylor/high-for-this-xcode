//
//  ContentView.swift
//  HighForThis
//
//  Created by Scott Taylor on 1/31/24.
//

import SwiftUI

struct Show: Identifiable {
    var id = UUID()
    var name: String
    var venue: String
    var date: String
}

struct ContentView: View {
    @State var shows = [
        Show(name: "Band of Horses", venue: "The Capitol Theatre", date: "2/2/2024"),
        Show(name: "Lucius", venue: "Brooklyn Steel", date: "2/3/2024"),
        Show(name: "Portugal. The Man.", venue: "The Capitol Theatre", date: "2/18/2024"),
        Show(name: "Zach Bryan", venue: "Prudential Center", date: "2/18/2024"),
        Show(name: "Drake", venue: "UBS Arena", date: "2/18/2024")
    ]
    
    var body: some View {
        
        VStack {
            List {
                for (date, shows) in showGroups() {
                    Section(header: Text(date)) {
                        ForEach(shows) { show in
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
    
    func showGroups() -> [String:[Show]] {
        var dict = [String:[Show]]()
        for show in shows {
            dict[show.date, default: []].append(show)
        }
        return dict
    }
}

#Preview {
    ContentView()
}
