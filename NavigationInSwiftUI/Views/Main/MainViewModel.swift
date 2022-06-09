//
//  MainViewModel.swift
//  NavigationInSwiftUI
//
//  Created by Krzysztof Werys on 07/06/2022.
//

import Foundation

final class MainViewModel: ObservableObject {
    enum RouteAction {
        case didTapSignOutButton
    }

    var routeAction: ((RouteAction) -> Void)?

    private var userRepository: UserRepositoryProtocol

    var userName: String {
        guard let user = userRepository.user else {
            assertionFailure("Signed in user is expected on this screen")
            return ""
        }
        return "\(user.firstName) \(user.lastName)"
    }

    init(userRepository: UserRepositoryProtocol = UserRepository.shared) {
        self.userRepository = userRepository
    }

    func didTapSignOutButton() {
        userRepository.signOut()

        routeAction?(.didTapSignOutButton)
    }
}
