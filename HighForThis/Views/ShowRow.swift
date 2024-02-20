import SwiftUI

struct ShowRow: View {
    var show: Show

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(show.artist.name).foregroundColor(.pink)
                Text(show.venue.name).foregroundColor(.gray)
            }

            Spacer()
        }
    }
}

#Preview {
    List {
        ShowRow(show: static_shows[0])
        ShowRow(show: static_shows[1])
    }
}
