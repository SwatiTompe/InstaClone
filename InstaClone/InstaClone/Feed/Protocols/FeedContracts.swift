//
//  FeedContracts.swift
//  InstaClone
//
//  Created by Techizer Mac02 on 08/05/25.
//

import Foundation

protocol FeedViewProtocol : AnyObject {
    func UpdatePosts()
}

@MainActor
protocol FeedPresenterProtocol : ObservableObject {
    var posts : [Post] { get }
    func loadPosts()
}

protocol FeedInteractorProtocol {
    func fetchPosts() async -> [Post]
}

protocol FeedRouterProtocol {
    static func CreateModule() -> FeedView
}
