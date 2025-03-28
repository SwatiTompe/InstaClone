//
//  FeedPresenter.swift
//  InstaClone
//
//  Created by Techizer Mac02 on 28/03/25.
//

import Foundation

protocol FeedPresenterProtocol : ObservableObject {
    var posts : [Post] {get} //data for view
    func loadPosts()
}

class FeedPresenter : FeedPresenterProtocol {
    @Published var posts: [Post] = [] //observable by the view
    private let interactor : FeedInteractorProtocol
    
    init(interactor:FeedInteractorProtocol) {
        self.interactor = interactor
    }
    
    func loadPosts() {
        interactor.fetchPosts {[weak self] fetchedPosts in
            DispatchQueue.main.async {
                self?.posts = fetchedPosts
            }
        }
    }
}
