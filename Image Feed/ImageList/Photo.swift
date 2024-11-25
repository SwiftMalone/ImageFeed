import Foundation

struct Photo: Decodable {
    let id: String
    let size: CGSize
    let createdAt: String?
    let welcomeDescription: String?
    let thumbImageURL: String
    let largeImageURL: String
    let isLiked: Bool
}
extension Photo {
    init(from photoResult: PhotoResult) {
        self.id = photoResult.id
        self.size = photoResult.size
        self.createdAt = photoResult.createdAt
        self.welcomeDescription = photoResult.description
        self.thumbImageURL = photoResult.urls.regular
        self.largeImageURL = photoResult.urls.full
        self.isLiked = photoResult.isLiked ?? false
    }
}
