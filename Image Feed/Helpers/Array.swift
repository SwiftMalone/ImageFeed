import Foundation

extension Array where Element == Photo {
    func withReplaced(at index: Int, new photo: Photo) -> [Photo] {
        var newArray = self
        newArray[index] = photo
        return newArray
    }
}
