//update the presenter :>>>>>>>

import Foundation

@MainActor
class FeedPresenter : FeedPresenterProtocol {
   @Published var posts: [Post] = []
    
    private let interactor : FeedInteractorProtocol
    
    init(interactor : FeedInteractorProtocol) {
        self.interactor = interactor
    }
    
    func loadPosts() {
        Task {
            self.posts = await interactor.fetchPosts()
        }
    }
    
}


/* SwiftUI and observableObject, we dont need to reference the view manually. swiftUI automatically observes the @Published property.
 
 
 
 */
