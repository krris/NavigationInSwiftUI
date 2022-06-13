//
//  UserRepositoryProtocolMock.swift
//  NavigationInSwiftUITests
//
//  Created by Krzysztof Werys on 12/06/2022.
//

@testable import NavigationInSwiftUI

final class UserRepositoryProtocolMock: UserRepositoryProtocol {
    var user: User?
    var userDraft: User?
    var isSignedIn: Bool = false

    var signInAndStoreUserDataCallsCount: Int = 0
    func signInAndStoreUserData() {
        signInAndStoreUserDataCallsCount += 1
    }

    var signOutCallsCount: Int = 0
    func signOut() {
        signOutCallsCount += 1
    }
}
