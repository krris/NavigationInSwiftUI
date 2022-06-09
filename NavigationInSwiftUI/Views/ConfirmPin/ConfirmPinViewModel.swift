//
//  ConfirmPinViewModel.swift
//  NavigationInSwiftUI
//
//  Created by Krzysztof Werys on 07/06/2022.
//

import Combine

final class ConfirmPinViewModel: ObservableObject {
    enum RouteAction {
        case didTapNextButton
    }

    var routeAction: ((RouteAction) -> Void)?

    @Published var confirmedPin: String = ""

    private var userRepository: UserRepositoryProtocol

    init(userRepository: UserRepositoryProtocol = UserRepository.shared) {
        self.userRepository = userRepository
    }

    var isNextButtonDisabled: Bool {
        !isPinValid
    }

    private var isPinValid: Bool {
        guard let pin = userRepository.userDraft?.pin,
              pin.isEmpty == false else {
            return false
        }

        return pin == confirmedPin
    }

    func didTapNextButton() {
        guard isPinValid else { return }

        // TODO: move to userRepository
        guard let userDraft = userRepository.userDraft else { return }
        userRepository.save(userDraft)

        routeAction?(.didTapNextButton)
    }
}
