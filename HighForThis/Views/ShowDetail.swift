import SwiftUI

struct ShowDetail: View {
    var show: Show

    var body: some View {
        VStack(alignment: .leading) {
            Text(show.dateFormatted()).foregroundColor(.gray).font(.title2)
            Text(show.name).foregroundColor(.pink).font(.title).padding(.vertical)
            Text(show.venue).foregroundColor(.gray).font(.title2)
        }.padding()
    }
}

#Preview {
    Group {
        ShowDetail(show: shows[0])
    }
}
