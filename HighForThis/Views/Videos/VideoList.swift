import SwiftUI
import HighForThisAPI
import CachedAsyncImage

struct VideoList: View {
    @State var videos: [VideoListNode]?
    
    var body: some View {
        VStack(alignment: .leading) {
            if videos == nil {
                Spacer()
                Loading()
            } else if videos!.count == 0 {
                Text("No videos.")
            } else {
                TextBlock {
                    Text("Videos").font(.title).fontWeight(.black)
                }
                List {
                    ForEach(videos!, id: \.self) { video in
                        Button(action: {
                            let url = URL(string: "https://www.youtube.com/watch?v=\(video.dataId)")
                            UIApplication.shared.open(url!)
                        }, label: {
                            HStack {
                                Paragraph(video.title).padding(.trailing).font(.caption)
                                let _ = print(video.thumbnails)
                                if let thumb = video.thumbnails.first(where: {$0.width != 0}) {
                                    let url = URL(string: thumb.url)
                                    Spacer()
                                    CachedAsyncImage(url: url) { image in
                                        image.resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 100).mask(Rectangle().padding(.vertical, 8))
                                    }  placeholder: {
                                        ImageLoading().frame(width: 100)
                                    }
                                }
                            }
                        })
                    }
                }.listStyle(.plain)
            }
            Spacer()
        }.onAppear() {
            let after: GraphQLNullable<String> = .none
            let first: GraphQLNullable<Int> = 10
            let year: GraphQLNullable<Int> = .none
            
            getVideos(after: after, first: first, year: year) { nodes in
                self.videos = nodes
            }
        }
    }
}

#Preview {
    AppWrapper {
        VideoList()
    }
}
