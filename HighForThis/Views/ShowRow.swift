import SwiftUI

struct ShowRow: View {
    var show: Show

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(show.name).foregroundColor(.pink)
                Text(show.venue.name).foregroundColor(.gray)
            }

            Spacer()
        }
    }
}

#Preview {
    Group {
        ShowRow(show: shows[0])
        ShowRow(show: shows[1])
    }
}
