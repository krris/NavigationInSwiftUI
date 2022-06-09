//
//  PersonalInfoViewModel.swift
//  NavigationInSwiftUI
//
//  Created by Krzysztof Werys on 07/06/2022.
//

import Combine

final class PersonalInfoViewModel: ObservableObject {
    enum RouteAction {
        case didTapNextButton
    }

    var routeAction: ((RouteAction) -> Void)?

    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var phoneNumber: String = ""

    private var userRepository: UserRepositoryProtocol

    init(userRepository: UserRepositoryProtocol = UserRepository.shared) {
        self.userRepository = userRepository
    }

    private var isFormValid: Bool {
        !firstName.isEmpty &&
        !lastName.isEmpty &&
        !phoneNumber.isEmpty
    }

    var isNextButtonDisabled: Bool {
        isFormValid == false
    }

    func didTapNextButton() {
        guard isFormValid else { return }
        userRepository.userDraft?.firstName = firstName
        userRepository.userDraft?.lastName = lastName
        userRepository.userDraft?.phoneNumber = phoneNumber

        routeAction?(.didTapNextButton)
    }
}
