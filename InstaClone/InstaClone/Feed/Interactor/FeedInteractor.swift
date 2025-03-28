//
//  FeedInteractor.swift
//  InstaClone
//
//  Created by Techizer Mac02 on 28/03/25.
//

import Foundation
import UIKit


protocol FeedInteractorProtocol {
    func fetchPosts(completion:@escaping ([Post]) -> Void)
}

class FeedInteractor : FeedInteractorProtocol {
    
    func fetchPosts(completion: @escaping ([Post]) -> Void) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/photos")!
        URLSession.shared.dataTask(with: url) { data, response, error
            in
            if let data = data {
                do {
                    let posts = try JSONDecoder().decode([Post].self, from: data)
                    completion(posts)
                } catch  {
                    print("failed to decode posts \(error)")
                    completion([])
                }
            }else {
                print("error fetching posts \(error?.localizedDescription ?? "unknown error")")
                completion([])
            }
        }.resume()
    }
}

