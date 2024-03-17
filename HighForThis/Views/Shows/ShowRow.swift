import SwiftUI
import HighForThisAPI

struct ShowRow: View {
    var show: HighForThisAPI.ShowsQuery.Data.Shows.Edge.Node

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

//struct ShowRow_Previews: PreviewProvider {
//    static var previews: some View {
//        let shows = StaticData.shows()
//        List {
//            ShowRow(show: shows[0])
//            ShowRow(show: shows[1])
//        }
//    }
//}
