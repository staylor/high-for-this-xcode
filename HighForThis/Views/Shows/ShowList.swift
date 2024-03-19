import SwiftUI
import HighForThisAPI

struct ShowList: View {
    var title: String
    var artistSlug: String = ""
    var venueSlug: String = ""
    @State private var loading = false
    @State private var showGroups: [ShowGroup] = []

    var body: some View {
        VStack(alignment: .leading) {
            if (loading) {
                Loading()
            } else if showGroups.count == 0 {
                Text("No recommended shows.")
            } else {
                List {
                    ForEach(showGroups) { group in
                        Section {
                            ForEach(group.shows, id: \.id) { show in
                                NavigationLink {
                                    ShowDetail(id: show.id)
                                } label: {
                                    HStack {
                                        VStack(alignment: .leading) {
                                            Text(show.artist.name).foregroundColor(.pink)
                                            Text(show.venue.name).foregroundColor(.gray)
                                        }

                                        Spacer()
                                    }
                                }
                            }
                        } header: {
                            Text(group.dateFormatted())
                                .foregroundColor(.black)
                                .fontWeight(.heavy)
                        }
                    }
                }.navigationTitle(title)
            }
            Spacer()
        }
        .onAppear() {
            var taxonomy: GraphQLNullable<String> = .none
            var term: GraphQLNullable<String> = .none
            if artistSlug != "" {
                taxonomy = "artist"
                term = .some(artistSlug)
            } else if venueSlug != "" {
                taxonomy = "venue"
                term = .some(venueSlug)
            }
            getShowList(term: term, taxonomy: taxonomy) { groups in
                self.showGroups = groups
                self.loading = false
            }
        }
    }
  
}

#Preview {
    NavigationView {
        ShowList(title: "Recommended")
    }.accentColor(.pink)
}
