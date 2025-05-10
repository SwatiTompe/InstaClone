
//update the interactor >>>>>

import Foundation

//simulates network call using async

class FeedInteractor : FeedInteractorProtocol {
    func fetchPosts() async -> [Post] {
        let url = URL(string: "https://jsonplaceholder.typicode.com/photos")!
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode([Post].self, from: data)
            
            return Array(decoded.prefix(20))
        } catch  {
            print("Error is = \(error)")
            return []
        }
    }
}


