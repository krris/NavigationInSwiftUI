//
//  CredentialsViewModel.swift
//  NavigationInSwiftUI
//
//  Created by Krzysztof Werys on 07/06/2022.
//

import Combine

protocol CredentialsViewModelProtocol: ObservableObject {
    var password: String { get set }
    var email: String { get set }

    var isNextButtonDisabled: Bool { get }
    func didTapNextButton()
}

final class CredentialsViewModel: CredentialsViewModelProtocol {
    enum RouteAction {
        case didTapNextButton
    }

    var routeAction: ((RouteAction) -> Void)?

    @Published var password: String = ""
    @Published var email: String = ""

    var isNextButtonDisabled: Bool {
        isFormValid == false
    }

    private var userRepository: UserRepositoryProtocol

    init(userRepository: UserRepositoryProtocol = UserRepository.shared) {
        self.userRepository = userRepository
    }

    func didTapNextButton() {
        guard isFormValid else { return }
        userRepository.userDraft = User()
        userRepository.userDraft?.password = password
        userRepository.userDraft?.email = email

        routeAction?(.didTapNextButton)
    }
}

// MARK: Private

private extension CredentialsViewModel {
    var isFormValid: Bool {
        !email.isEmpty && !password.isEmpty
    }
}
