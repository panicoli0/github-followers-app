
// Implement Follower.swift


import Foundation

struct Follower: Codable, Identifiable {
    var id: Int
    var login: String
    var avatarUrl: String
    let htmlUrl: String

    // Implement the CodingKeys enum to map the JSON keys to the properties of the struct.
    enum CodingKeys: String, CodingKey {
        case id
        case login
        case avatarUrl = "avatar_url"
        case htmlUrl = "html_url"
    }
}