import UIKit

final class OAuth2TokenStorage {
    private let storage = UserDefaults.standard
    
    private(set) var token: String? {
        get {
            storage.string(forKey: "accessKey")
        }
        set {
            storage.set(newValue, forKey: "accessKey")
        }
    }
    
    func store(token: String) {
        self.token = token
    }
    
    func removeToken() {
        token = nil
    }
}

