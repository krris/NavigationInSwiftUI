//
//  ConfirmPinViewModel.swift
//  NavigationInSwiftUI
//
//  Created by Krzysztof Werys on 07/06/2022.
//

import Combine

protocol ConfirmPinViewModelProtocol: ObservableObject {
    var confirmedPin: String { get set }

    var isNextButtonDisabled: Bool { get }
    func didTapNextButton()
}

final class ConfirmPinViewModel: ConfirmPinViewModelProtocol {
    enum RouteAction {
        case didTapNextButton
    }

    var routeAction: ((RouteAction) -> Void)?

    @Published var confirmedPin: String = ""

    var isNextButtonDisabled: Bool {
        !isPinValid
    }

    private var userRepository: UserRepositoryProtocol

    init(userRepository: UserRepositoryProtocol = UserRepository.shared) {
        self.userRepository = userRepository
    }

    func didTapNextButton() {
        guard isPinValid else { return }
        userRepository.signInAndStoreUserData()
        routeAction?(.didTapNextButton)
    }
}

// MARK: Private

private extension ConfirmPinViewModel {
    var isPinValid: Bool {
        guard let pin = userRepository.userDraft?.pin,
              pin.isEmpty == false else {
            return false
        }

        return pin == confirmedPin
    }
}
