//
//  ContentView.swift
//  HighForThis
//
//  Created by Scott Taylor on 1/31/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ShowList()
                .tabItem {
                    Label("Shows", systemImage: "calendar")
                }
            PodcastList()
                .tabItem {
                    Label("Podcast", systemImage: "mic.circle")
                }
            Videos()
                .tabItem {
                    Label("Videos", systemImage: "video")
                }
        }.accentColor(.pink)
    }
}

#Preview {
    ContentView()
}
