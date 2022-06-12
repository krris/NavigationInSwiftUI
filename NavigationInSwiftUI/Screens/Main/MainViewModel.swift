//
//  MainViewModel.swift
//  NavigationInSwiftUI
//
//  Created by Krzysztof Werys on 07/06/2022.
//

import Foundation

protocol MainViewModelProtocol {
    var userName: String { get }
    var phoneNumber: String { get }
    var email: String { get }
    func didTapSignOutButton()
}

final class MainViewModel: MainViewModelProtocol {
    enum RouteAction {
        case didTapSignOutButton
    }

    var routeAction: ((RouteAction) -> Void)?

    var userName: String {
        guard let user = user else { return "" }
        return "\(user.firstName) \(user.lastName)"
    }

    var phoneNumber: String {
        guard let user = user else { return "" }
        return "\(user.phoneNumber)"
    }

    var email: String {
        guard let user = user else { return "" }
        return "\(user.email)"
    }

    private var user: User? {
        guard let user = userRepository.user else {
            assertionFailure("Signed in user is expected on this screen")
            return nil
        }
        return user
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
