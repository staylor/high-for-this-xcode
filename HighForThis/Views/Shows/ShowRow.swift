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

struct ShowRow_Previews: PreviewProvider {
    static var previews: some View {
        let shows = StaticData.shows()
        List {
            ShowRow(show: shows[0])
            ShowRow(show: shows[1])
        }
    }
}
