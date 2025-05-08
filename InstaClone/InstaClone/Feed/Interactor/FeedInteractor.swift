
//update the interactor >>>>>

import Foundation

protocol FeedInteractorProtocol {
    func fetchPosts(completion: @escaping([Post]) -> Void)
}

class FeedInteractor : FeedInteractorProtocol {
    
    func fetchPosts(completion: @escaping ([Post]) -> Void) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/photos")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let posts = try JSONDecoder().decode([Post].self, from: data)
                    completion(posts)
                } catch  {
                    print("failed to decode posts : \(error)")
                    completion([])
                }
            }
            else {
                print("error fetching posts : \(error?.localizedDescription ?? "Unknown error")")
                completion([])
            }
        }.resume()
    }
}


class MockFeedInteractor : FeedInteractorProtocol {
    func fetchPosts(completion: @escaping ([Post]) -> Void) {
        //simulated mock data
        let mockPosts = [
            Post(id: 1, title: "Mock Post 1", url: "https://via.placeholder.com/300", thumbnailUrl: ""),
            Post(id: 2, title: "Mock Post 2", url: "https://via.placeholder.com/300", thumbnailUrl: "")
        ]
        completion(mockPosts)
    }
}
