import Foundation

struct Youtubes: Codable {
    let youtubes: [Youtube]
    let error: Bool
    let errorMsg: String
    
    enum CodingKeys: String, CodingKey {
        case youtubes, error
        case errorMsg = "error_msg"
    }
}

struct Youtube: Codable {
    let id, title, subtitle: String
    let avatarImage: String
    let youtubeImage: String
    
    enum CodingKeys: String, CodingKey {
        case id, title, subtitle
        case avatarImage = "avatar_image"
        case youtubeImage = "youtube_image"
    }
}
