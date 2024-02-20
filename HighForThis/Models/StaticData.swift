struct StaticData {
    static func shows() -> [Show] {
        let shows: [Show] = loadJsonFile("shows.json")
        return shows
    }
    
    static func podcasts() -> [PodcastEpisode] {
        let podcasts: [PodcastEpisode] = loadJsonFile("podcasts.json")
        return podcasts
    }
}
