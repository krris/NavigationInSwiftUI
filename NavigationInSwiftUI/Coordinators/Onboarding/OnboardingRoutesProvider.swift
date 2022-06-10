//
//  OnboardingRoutesProvider.swift
//  NavigationInSwiftUI
//
//  Created by Krzysztof Werys on 10/06/2022.
//

import Combine
import FlowStacks

final class OnboardingRoutesProvider: ObservableObject {
    @Published var routes: Routes<OnboardingCoordinator.Screen> = []

    var didComplete: (() -> ())?

    init() {
        let viewModel = WelcomeViewModel()
        viewModel.routeAction = { [weak self] action in
            switch action {
            case .didTapNextButton:
                self?.displayTermsOfServiceScreen()
            }
        }
        let screen = OnboardingCoordinator.Screen.welcome(viewModel)
        routes.presentSheet(screen, embedInNavigationView: true)
    }

    private func displayTermsOfServiceScreen() {
        let viewModel = TermsOfServiceViewModel()
        viewModel.routeAction = { [weak self] action in
            switch action {
            case .didTapNextButton:
                self?.displayCredentialsScreen()
            }
        }
        let screen = OnboardingCoordinator.Screen.termsOfService(viewModel)
        routes.push(screen)
    }

    private func displayCredentialsScreen() {
        let viewModel = CredentialsViewModel()
        viewModel.routeAction = { [weak self] action in
            switch action {
            case .didTapNextButton:
                self?.displayPersonalInfoScreen()
            }
        }
        let screen = OnboardingCoordinator.Screen.credentials(viewModel)
        routes.push(screen)
    }

    private func displayPersonalInfoScreen() {
        let viewModel = PersonalInfoViewModel()
        viewModel.routeAction = { [weak self] action in
            switch action {
            case .didTapNextButton:
                self?.displayNewPinScreen()
            }
        }
        let screen = OnboardingCoordinator.Screen.personalInfo(viewModel)
        routes.push(screen)
    }

    private func displayNewPinScreen() {
        let viewModel = NewPinViewModel()
        viewModel.routeAction = { [weak self] action in
            switch action {
            case .didTapNextButton:
                self?.displayConfirmPinScreen()
            }
        }
        let screen = OnboardingCoordinator.Screen.newPin(viewModel)
        routes.push(screen)
    }

    private func displayConfirmPinScreen() {
        let viewModel = ConfirmPinViewModel()
        viewModel.routeAction = { [weak self] action in
            switch action {
            case .didTapNextButton:
                self?.completeFlow()
            }
        }
        let screen = OnboardingCoordinator.Screen.confirmPin(viewModel)
        routes.push(screen)
    }

    private func completeFlow() {
        didComplete?()
        Task { @MainActor in
            RouteSteps.withDelaysIfUnsupported(self, \.routes) {
              $0.goBackToRoot()
            }
        }
    }
}
