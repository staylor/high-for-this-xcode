import SwiftUI
import CoreLocation

struct ShowDetail: View {
    var show: Show

    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading) {
                Text(show.dateFormatted()).foregroundColor(.gray).font(.title2)
                Text(show.name).foregroundColor(.pink).font(.title)
                Text(show.venue.name).foregroundColor(.gray).font(.title2)
            }
        }
    }
}

#Preview {
    ShowDetail(show: shows[0])
}
