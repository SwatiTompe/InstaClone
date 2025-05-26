//
//  FeedContracts.swift
//  InstaClone
//
//  Created by Techizer Mac02 on 08/05/25.
//

import Foundation
import SwiftUI

protocol FeedViewProtocol : AnyObject {
    func UpdatePosts()
}

@MainActor
protocol FeedPresenterProtocol : ObservableObject {
    var posts : [Post] { get }
    func loadPosts() async
}

protocol FeedInteractorProtocol {
    func fetchPosts() async -> [Post]
}

@MainActor
protocol FeedRouterProtocol {
    static func CreateModule() -> AnyView
}


