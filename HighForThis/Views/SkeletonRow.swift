import SwiftUI

struct SkeletonRow: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("This is a hidden heading").redacted(reason: .placeholder)
                Text("With a subhead").redacted(reason: .placeholder)
            }

            Spacer()
        }
    }
}

#Preview {
    SkeletonRow()
}
