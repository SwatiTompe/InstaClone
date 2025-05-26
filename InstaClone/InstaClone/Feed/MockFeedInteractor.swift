//
//  MockFeedInteractor.swift
//  InstaClone
//
//  Created by Techizer Mac02 on 26/05/25.
//

import Foundation

#if DEBUG
class MockFeedInteractor: FeedInteractorProtocol {
    func fetchPosts() async -> [Post] {
        return [
            Post(id: 1, title: "Post 1", url: "", thumbnailUrl: ""),
            Post(id: 2, title: "Post 2", url: "", thumbnailUrl: "")
        ]
    }
}
#endif
