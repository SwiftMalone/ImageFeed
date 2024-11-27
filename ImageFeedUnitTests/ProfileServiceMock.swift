import Foundation
import Image_Feed

final class ProfileServiceMock: ProfileServiceProtocol {
    func fetchProfile(completion: @escaping (Result<Profile, any Error>) -> Void) {
        
    }
    
    var profile: Profile?
}
