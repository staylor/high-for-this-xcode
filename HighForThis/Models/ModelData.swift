import Foundation
import SwiftUI

var SHOWS_URL = cdnUrl("ios/shows.json")
var PODCASTS_URL = cdnUrl("ios/podcasts.json")

func loadJsonFile<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

func loadJsonUrl<T: Decodable>(url: String, completion: @escaping ((T) -> ())) {
    guard let jsonUrl = URL(string: url) else {
        fatalError("Couldn't load \(url).")
    }

    URLSession.shared.dataTask(with: jsonUrl) { data, response, error in
        guard let data = data else { return }
        do {
            let payload = try JSONDecoder().decode(T.self, from: data)
            DispatchQueue.main.async {
                completion(payload)
            }
        } catch {
            print(error.localizedDescription)
        }
    }.resume()
}

