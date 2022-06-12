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
    private let emailValidator: EmailValidating

    init(
        userRepository: UserRepositoryProtocol = UserRepository.shared,
        emailValidator: EmailValidating = EmailValidator()
    ) {
        self.userRepository = userRepository
        self.emailValidator = emailValidator
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
        emailValidator.isValid(email) &&
        !password.isEmpty
    }
}
