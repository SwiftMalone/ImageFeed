import Foundation

public protocol ProfileViewProtocol: AnyObject {
    func updateProfileDetails(name: String?, login: String?, bio: String?)
    func updateAvatar(with url: URL?)
    func showLogoutAlert()
}

protocol ProfileViewPresenterProtocol {
    func viewDidLoad()
    func didTapLogoutButton()
}

final class ProfileViewPresenter: ProfileViewPresenterProtocol {
    
    weak var view: ProfileViewProtocol?
    private let profileService: ProfileServiceProtocol
    private let profileImageService: ProfileImageServiceProtocol
    
    init(view: ProfileViewProtocol, profileService: ProfileServiceProtocol, profileImageService: ProfileImageServiceProtocol) {
        self.view = view
        self.profileService = profileService
        self.profileImageService = profileImageService
        
        NotificationCenter.default.addObserver(self, selector: #selector(profileImageDidChange), name: ProfileImageService.didChangeNotification, object: nil)
    }
    
    func viewDidLoad() {
        updateProfileDetails()
        updateAvatar()
    }
    
    func didTapLogoutButton() {
        view?.showLogoutAlert()
    }
    
    @objc private func profileImageDidChange() {
        updateAvatar()
    }
    
    private func updateProfileDetails() {
        let profile = profileService.profile
        view?.updateProfileDetails(name: profile?.name, login: "@\(profile?.name ?? "")", bio: profile?.bio)
    }
    
    private func updateAvatar() {
        guard let profileImageURL = profileImageService.avatarURL, let url = URL(string: profileImageURL) else {
            view?.updateAvatar(with: nil)
            return
        }
        view?.updateAvatar(with: url)
    }
}
