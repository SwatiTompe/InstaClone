//
//  Post.swift
//  InstaClone
//
//  Created by Techizer Mac02 on 28/03/25.
//

import Foundation


struct Post: Codable, Identifiable {
    let id: Int
    let title : String
    let url: String
    let thumbnailURL : String
}
