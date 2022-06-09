//
//  MainViewModel.swift
//  NavigationInSwiftUI
//
//  Created by Krzysztof Werys on 07/06/2022.
//

import Foundation

class MainViewModel: ObservableObject {
    enum RouteAction {
        case didTapSignOutButton
    }

    var routeAction: ((RouteAction) -> Void)?

    // TODO: inject
    private var userRepository: UserRepositoryProtocol = UserRepository.shared

    var userName: String {
        guard let user = userRepository.user else {
            assertionFailure("Signed in user is expected on this screen")
            return ""
        }
        return user.firstName
    }

    func didTapSignOutButton() {
        userRepository.signOut()

        routeAction?(.didTapSignOutButton)
    }
}
