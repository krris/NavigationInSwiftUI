//
//  MainViewModel.swift
//  NavigationInSwiftUI
//
//  Created by Krzysztof Werys on 07/06/2022.
//

import Foundation

protocol MainViewModelProtocol {
    var userName: String { get }
}

final class MainViewModel: MainViewModelProtocol {
    enum RouteAction {
        case didTapSignOutButton
    }

    var routeAction: ((RouteAction) -> Void)?

    var userName: String {
        guard let user = userRepository.user else {
            assertionFailure("Signed in user is expected on this screen")
            return ""
        }
        return "\(user.firstName) \(user.lastName)"
    }

    private var userRepository: UserRepositoryProtocol

    init(userRepository: UserRepositoryProtocol = UserRepository.shared) {
        self.userRepository = userRepository
    }

    func didTapSignOutButton() {
        userRepository.signOut()

        routeAction?(.didTapSignOutButton)
    }
}
