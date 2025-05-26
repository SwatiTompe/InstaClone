

import Foundation

class FeedInteractor : FeedInteractorProtocol {
    
    private let cache: PostCacheActor
    private let networkService: NetworkService
    
    init(networkService:NetworkService, cache:PostCacheActor = PostCacheActor())
    {
        self.networkService = networkService
        self.cache = cache
    }
    
    func fetchPosts() async -> [Post] {
        //check cache first
        let cachedArray = await cache.getPosts()
        if !cachedArray.isEmpty {
            return cachedArray
        }
        
        //now use the real or mock network service
        do {
            let url = URL(string: "https://jsonplaceholder.typicode.com/photos")! //dummy url
            let fetchedPosts : [Post] = try await networkService.fetch([Post].self, from: url)
            await cache.save(posts: fetchedPosts)
            return fetchedPosts
            
        } catch  {
            return []
        }
    }
}
 


























































































