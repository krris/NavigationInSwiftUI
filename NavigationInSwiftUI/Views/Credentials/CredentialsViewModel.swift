//
//  CredentialsViewModel.swift
//  NavigationInSwiftUI
//
//  Created by Krzysztof Werys on 07/06/2022.
//

import Combine

final class CredentialsViewModel: ObservableObject {
    enum RouteAction {
        case didTapNextButton
    }

    var routeAction: ((RouteAction) -> Void)?

    @Published var password: String = ""
    @Published var email: String = ""

    // TODO: inject
    private var userRepository: UserRepositoryProtocol = UserRepository.shared

    var isNextButtonDisabled: Bool {
        isFormValid == false
    }

    func didTapNextButton() {
        guard isFormValid else { return }
        userRepository.userDraft?.password = password
        userRepository.userDraft?.email = email

        routeAction?(.didTapNextButton)
    }

    private var isFormValid: Bool {
        !email.isEmpty && !password.isEmpty
    }
}
