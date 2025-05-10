import Foundation

struct Post: Codable,Identifiable {
    let id : UUID
    let title : String
    let url : String
}
