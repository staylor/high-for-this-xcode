import Foundation
import Apollo
import HighForThisAPI

var PREVIEW_SHOW_ID = ObjID("5a3d8330bf3bd82f73a5ffab")

let cachePolicy: CachePolicy = .returnCacheDataElseFetch

struct Network {
    static var shared = Network()
    
    private(set) lazy var apollo: ApolloClient = {
        let client = URLSessionClient()
        let cache = InMemoryNormalizedCache()
        let url = URL(string: "https://graphql.highforthis.com/graphql")
        
        let store = ApolloStore(cache: cache)
        let provider = DefaultInterceptorProvider(client: client, store: store)
        let transport = RequestChainNetworkTransport(interceptorProvider: provider, endpointURL: url!)
        
        return ApolloClient(networkTransport: transport, store: store)
    }()
}

typealias ShowListNode = HighForThisAPI.ShowsQuery.Data.Shows.Edge.Node
typealias ShowData = HighForThisAPI.ShowQuery.Data.Show
typealias ShowVenueCoordinates = HighForThisAPI.ShowQuery.Data.Show.Venue.AsVenue.Coordinates

func showGroups(_ nodes: [ShowListNode]) -> [ShowGroup] {
    var dict: [Double:ShowGroup] = [:]
    for show in nodes {
        if dict[show.date] == nil {
            dict[show.date] = ShowGroup(date: show.date, shows: []);
        }
        dict[show.date]!.shows.append(show)
    }
    let sortedKeys = dict.keys.sorted()
    var byDate: [ShowGroup] = []
    for key in sortedKeys {
        byDate.append(dict[key]!)
    }
    return byDate
}

func getShow(id: ObjID, completion: @escaping ((ShowData) -> ())) {
    let query = HighForThisAPI.ShowQuery(id: id)
    Network.shared.apollo.fetch(query: query, cachePolicy: cachePolicy) { result in
        guard let data = try? result.get().data else { return }

        completion(data.show!);
    }
}

func getShowList(completion: @escaping (([ShowGroup]) -> ())) {
    let query = HighForThisAPI.ShowsQuery()
    Network.shared.apollo.fetch(query: query, cachePolicy: cachePolicy) { result in    
        switch result {
        case.success(let graphQLResult):
            var nodes = [ShowListNode]()
            for edge in graphQLResult.data!.shows!.edges {
                nodes.append(edge.node)
            }
            
            completion(showGroups(nodes));
        case .failure(_):
            completion([])
        }
    }
}
