//
//  PostCacheActor.swift
//  InstaClone
//
//  Created by Techizer Mac02 on 20/05/25.
//


import Foundation

actor PostCacheActor {
    
    private var cachedPosts : [Post] = []
    
    func save(posts: [Post]) {
        self.cachedPosts = posts
    }
    
    func getPosts() -> [Post] {
        return self.cachedPosts
    }
    
    func clear() {
        self.cachedPosts = []
    }
    
}











