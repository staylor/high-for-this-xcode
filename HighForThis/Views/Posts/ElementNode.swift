import SwiftUI
import HighForThisAPI

struct ElementNode: View {
    var node: PostData.EditorState.Root.Child.AsElementNode
    
    var body: some View {
        switch node.type {
        case "paragraph":
            TextBlock {
                node.children!.map {
                    let node = $0!.asTextNode!
                    let v = Text(node.text!)
                    return formatText(view: v, format: node.format!)
                }.reduce(Text(""), +)
            }
        default:
            EmptyView()
        }
    }
}
