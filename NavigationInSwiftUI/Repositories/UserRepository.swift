//
//  UserRepository.swift
//  NavigationInSwiftUI
//
//  Created by Krzysztof Werys on 08/06/2022.
//

import Foundation

protocol UserRepositoryProtocol {
    var user: User? { get }
    var userDraft: User? { get set }
    var isSignedIn: Bool { get}

    func signInAndStoreUserData()
    func signOut()
}

final class UserRepository: UserRepositoryProtocol {
    private enum Constants {
        static let userKey: String = "com.kwcodes.user.key"
    }

    static let shared: UserRepositoryProtocol = UserRepository()

    var user: User? {
        dataStorage.getData(for: Constants.userKey)
    }
    
    var userDraft: User?

    var isSignedIn: Bool {
        user != nil
    }

    private let dataStorage: SafeDataStoring

    private init(dataStorage: SafeDataStoring = SafeDataStorage()) {
        self.dataStorage = dataStorage
    }

    func signInAndStoreUserData() {
        guard let userDraft = userDraft else { return }

        dataStorage.save(
            data: userDraft,
            for: Constants.userKey
        )
    }

    func signOut() {
        dataStorage.removeObject(for: Constants.userKey)
    }
}
