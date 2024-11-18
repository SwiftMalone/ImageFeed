
import Foundation

struct UserResult: Codable {
    let profileImage: ProfileImage
}

struct ProfileImage: Codable {
    let small, medium, large: String
}
