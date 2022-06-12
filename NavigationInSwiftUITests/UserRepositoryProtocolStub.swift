//
//  UserRepositoryProtocolStub.swift
//  NavigationInSwiftUITests
//
//  Created by Krzysztof Werys on 12/06/2022.
//

@testable import NavigationInSwiftUI

struct UserRepositoryProtocolStub: UserRepositoryProtocol {
    var user: User?
    var userDraft: User?
    var isSignedIn: Bool {
        false
    }

    func signInAndStoreUserData() {}
    func signOut() {}
}
