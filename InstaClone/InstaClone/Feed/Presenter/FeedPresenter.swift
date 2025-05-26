
import Foundation

@MainActor
class FeedPresenter : FeedPresenterProtocol {
    @Published var posts: [Post] = []
    @Published var errorMessage : String?
    
    private let interactor : FeedInteractorProtocol
    
    init(interactor : FeedInteractorProtocol) {
        self.interactor = interactor
    }
    
    func loadPosts() async {
        do {
            let posts = try await interactor.fetchPosts()
            self.posts = posts
        } catch  {
            self.errorMessage = "failed to load posts : \(error.localizedDescription)"
        }
    }
}


