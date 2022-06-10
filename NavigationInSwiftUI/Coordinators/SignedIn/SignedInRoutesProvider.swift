//
//  SignedInRoutesProvider.swift
//  NavigationInSwiftUI
//
//  Created by Krzysztof Werys on 10/06/2022.
//

import Combine
import FlowStacks

final class SignedInRoutesProvider: ObservableObject {
    @Published var routes: Routes<SignedInCoordinator.Screen> = []

    var didComplete: (() -> ())?

    init() {
        displayMainScreen()
    }

    func displayMainScreen() {
        let viewModel = MainViewModel()
        viewModel.routeAction = { [weak self] action in
            switch action {
            case .didTapSignOutButton:
                self?.didComplete?()
            }
        }
        let screen = SignedInCoordinator.Screen.main(viewModel)
        routes.push(screen)
    }
}
