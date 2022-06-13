//
//  PersonalInfoViewModel.swift
//  NavigationInSwiftUI
//
//  Created by Krzysztof Werys on 07/06/2022.
//

import Combine

protocol PersonalInfoViewModelProtocol: ObservableObject {
    var firstName: String { get set }
    var lastName: String { get set }
    var phoneNumber: String { get set }

    var isNextButtonDisabled: Bool { get }
    func didTapNextButton()
}

final class PersonalInfoViewModel: PersonalInfoViewModelProtocol {
    enum RouteAction {
        case didTapNextButton
    }

    var routeAction: ((RouteAction) -> Void)?

    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var phoneNumber: String = ""

    var isNextButtonDisabled: Bool {
        isFormValid == false
    }

    private var userRepository: UserRepositoryProtocol

    init(userRepository: UserRepositoryProtocol = UserRepository.shared) {
        self.userRepository = userRepository
    }

    func didTapNextButton() {
        guard isFormValid else { return }
        userRepository.userDraft?.firstName = firstName
        userRepository.userDraft?.lastName = lastName
        userRepository.userDraft?.phoneNumber = phoneNumber

        routeAction?(.didTapNextButton)
    }
}

// MARK: Private

private extension PersonalInfoViewModel {
    var isFormValid: Bool {
        !firstName.isEmpty &&
        !lastName.isEmpty &&
        !phoneNumber.isEmpty
    }
}
