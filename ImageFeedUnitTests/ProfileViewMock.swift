import Foundation
import Image_Feed

final class ProfileViewMock: ProfileViewProtocol {
    
    
    var updatedName: String?
    var updatedLogin: String?
    var updatedBio: String?
    var avatarURL: URL?
    var isLogoutConfirmationShown = false
    
    func updateProfileDetails(name: String?, login: String?, bio: String?) {
        updatedName = name
        updatedLogin = login
        updatedBio = bio
    }
    
    func updateAvatar(with url: URL?) {
        avatarURL = url
    }
    
    func showLogoutAlert() {
        isLogoutConfirmationShown = true
    }
}
