import SwiftUI

struct SkeletonSection: View {
    var body: some View {
        Section {
            SkeletonRow()
            SkeletonRow()
        } header: {
            Text("Group Heading").fontWeight(.heavy).redacted(reason: .placeholder)
        }
    }
}

#Preview {
    VStack(alignment: .leading) {
        SkeletonSection()
    }
}
