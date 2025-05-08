import Foundation

struct Post: Codable,Identifiable {
    let id : Int
    let userName : String
    let imageURL : String
    let caption : String
}
