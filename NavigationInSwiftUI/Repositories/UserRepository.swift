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
    func save(_ user: User)
    func signOut()
}

final class UserRepository: UserRepositoryProtocol {
    private enum Constants {
        static let userKey: String = "com.kwcodes.user.key"
    }

    private init() {}

    static let shared: UserRepositoryProtocol = UserRepository()

    var user: User? {
        dataStorage.getData(for: Constants.userKey)
    }
    var userDraft: User?

    private(set) var isSignedIn: Bool = false

    // TODO: inject
    private let dataStorage = SafeDataStorage()

    func save(_ user: User) {
        dataStorage.save(
            data: user,
            for: Constants.userKey
        )
    }

    func signOut() {
        dataStorage.removeObject(for: Constants.userKey)
    }
}
