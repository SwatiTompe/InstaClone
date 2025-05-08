//update the presenter :>>>>>>>

import Foundation

//update the presenter to  fetch posts asynchronously

protocol FeedPresenterProtocol : ObservableObject {
    var posts : [Post] { get } //data for the view
    func loadPosts()
}

class Feedpresenter : FeedPresenterProtocol {
    @Published var posts: [Post] = [] //observable by the view
    private let interactor : FeedInteractorProtocol
    
    init(interactor: FeedInteractorProtocol) {
        self.interactor = interactor
    }
    
    func loadPosts() {
        interactor.fetchPosts { [weak self] fetchedPosts in
            DispatchQueue.main.async {
                self?.posts = fetchedPosts
            }
        }
    }
}
