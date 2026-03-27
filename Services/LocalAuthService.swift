import Foundation
import SwiftUI

/// Local-only auth service — no Firebase, no network.
/// Stores credentials in UserDefaults for offline use.
@MainActor
class LocalAuthService: ObservableObject {
    static let shared = LocalAuthService()

    @Published var isAuthenticated: Bool = false
    @Published var userName: String = ""
    @Published var errorMessage: String?

    private let authKey = "localAuth_isAuthenticated"
    private let nameKey = "localAuth_userName"

    private init() {
        isAuthenticated = UserDefaults.standard.bool(forKey: authKey)
        userName = UserDefaults.standard.string(forKey: nameKey) ?? ""
    }

    /// Login with just a name.
    func login(name: String) -> Bool {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please enter your name."
            return false
        }

        UserDefaults.standard.set(name, forKey: nameKey)
        UserDefaults.standard.set(true, forKey: authKey)

        self.userName = name
        self.isAuthenticated = true
        self.errorMessage = nil

        ProgressService.shared.updateUserName(name)
        return true
    }

    func signOut() {
        UserDefaults.standard.set(false, forKey: authKey)
        self.isAuthenticated = false
        ProgressService.shared.resetProgress()
        CodeStorageService.shared.clearAll()
        PortfolioService.shared.resetPortfolio()
        UserDefaults.standard.removeObject(forKey: "hasCompletedOnboarding")
        UserDefaults.standard.removeObject(forKey: "hasSeenWelcome")
    }
    
    // Compatibility shim so views that reference .user?.uid still compile
    var user: LocalUser? {
        isAuthenticated ? LocalUser(name: userName) : nil
    }
}

struct LocalUser {
    let name: String
    // uid is just the name for local storage keying
    var uid: String { name }
}
