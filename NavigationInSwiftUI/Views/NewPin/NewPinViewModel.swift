//
//  NewPinViewModel.swift
//  NavigationInSwiftUI
//
//  Created by Krzysztof Werys on 07/06/2022.
//

import Combine

final class NewPinViewModel: ObservableObject {
    enum RouteAction {
        case didTapNextButton
    }

    var routeAction: ((RouteAction) -> Void)?

    @Published var pin: String = ""

    private var userRepository: UserRepositoryProtocol

    init(userRepository: UserRepositoryProtocol = UserRepository.shared) {
        self.userRepository = userRepository
    }

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
