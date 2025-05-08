import Foundation

struct Post: Codable,Identifiable {
    let id : Int
    let title : String
    let url : String
    let thumbnailUrl : String
}
