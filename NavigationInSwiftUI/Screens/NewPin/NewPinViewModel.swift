//
//  NewPinViewModel.swift
//  NavigationInSwiftUI
//
//  Created by Krzysztof Werys on 07/06/2022.
//

import Combine

protocol NewPinViewModelProtocol: ObservableObject {
    var pin: String { get set }

    var isNextButtonDisabled: Bool { get }
    func didTapNextButton()
}

final class NewPinViewModel: NewPinViewModelProtocol {
    enum RouteAction {
        case didTapNextButton
    }

    var routeAction: ((RouteAction) -> Void)?

    @Published var pin: String = ""

    var isNextButtonDisabled: Bool {
        pin.isEmpty
    }

    private var userRepository: UserRepositoryProtocol

    init(userRepository: UserRepositoryProtocol = UserRepository.shared) {
        self.userRepository = userRepository
    }

    func didTapNextButton() {
        guard isFormValid else { return }
        userRepository.userDraft?.pin = pin

        routeAction?(.didTapNextButton)
    }
}

// MARK: Private

private extension NewPinViewModel {
    var isFormValid: Bool {
        !pin.isEmpty
    }
}

