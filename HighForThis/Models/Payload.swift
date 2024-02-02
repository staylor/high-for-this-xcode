import SwiftUI

struct Payload: Hashable, Codable {
    var podcasts: [PodcastEpisode]
    var shows: [Show]
}
