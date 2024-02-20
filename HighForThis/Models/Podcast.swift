import SwiftUI

struct PodcastEpisode: Hashable, Codable, Identifiable {
    var id: Int
    var title: String
    var description: String
    var audio: String
}
