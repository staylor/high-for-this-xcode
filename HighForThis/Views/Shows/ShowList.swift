import SwiftUI

struct ShowList: View {
    @State private var loading = false
    @State private var showGroups: [ShowGroup] = []

    var body: some View {
        VStack(alignment: .leading) {
            if (loading) {
                Loading()
            } else if showGroups.count == 0 {
                Text("No recommended shows.")
            } else {
                NavigationView {
                    List {
                        ForEach(showGroups) { group in
                            Section {
                                ForEach(group.shows, id: \.id) { show in
                                    NavigationLink {
                                        ShowDetail(id: show.id)
                                    } label: {
                                        ShowRow(show: show)
                                    }
                                }
                            } header: {
                                Text(group.dateFormatted())
                                    .foregroundColor(.black)
                                    .fontWeight(.heavy)
                            }
                        }
                    }.navigationTitle("Recommended")
                }
                // color of back button
                .accentColor(.pink)
            }
        }.onAppear() {
            getShowList() { groups in
                self.showGroups = groups
                self.loading = false
            }
        }
    }
  
}

#Preview {
    ShowList()
}
