//
//  NewPinViewModel.swift
//  NavigationInSwiftUI
//
//  Created by Krzysztof Werys on 07/06/2022.
//

import Combine

class NewPinViewModel: ObservableObject {
    enum RouteAction {
        case didTapNextButton
    }

    var routeAction: ((RouteAction) -> Void)?

    @Published var pin: String = ""

    // TODO: inject
    private var userRepository: UserRepositoryProtocol = UserRepository.shared

    var isNextButtonDisabled: Bool {
        pin.isEmpty
    }

    private var isFormValid: Bool {
        !pin.isEmpty
    }

    func didTapNextButton() {
        guard isFormValid else { return }
        userRepository.userDraft?.pin = pin

        routeAction?(.didTapNextButton)
    }
}
