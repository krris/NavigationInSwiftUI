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

    var didComplete: (() -> Void)?

    private let welcomeViewModel: WelcomeViewModel
    private let termsOfServiceViewModel: TermsOfServiceViewModel
    private let credentialsViewModel: CredentialsViewModel
    private let personalInfoViewModel: PersonalInfoViewModel
    private let newPinViewModel: NewPinViewModel
    private let confirmPinViewModel: ConfirmPinViewModel

    init(
        welcomeViewModel: WelcomeViewModel = WelcomeViewModel(),
        termsOfServiceViewModel: TermsOfServiceViewModel = TermsOfServiceViewModel(),
        credentialsViewModel: CredentialsViewModel = CredentialsViewModel(),
        personalInfoViewModel: PersonalInfoViewModel = PersonalInfoViewModel(),
        newPinViewModel: NewPinViewModel = NewPinViewModel(),
        confirmPinViewModel: ConfirmPinViewModel = ConfirmPinViewModel()
    ) {
        self.termsOfServiceViewModel = termsOfServiceViewModel
        self.welcomeViewModel = welcomeViewModel
        self.credentialsViewModel = credentialsViewModel
        self.personalInfoViewModel = personalInfoViewModel
        self.newPinViewModel = newPinViewModel
        self.confirmPinViewModel = confirmPinViewModel

        setUpRouteActions()
        makeRootScreen()
    }
}

// MARK: - Private

private extension OnboardingRoutesProvider {

    func setUpRouteActions() {
        welcomeViewModel.routeAction = { [weak self] action in
            switch action {
            case .didTapNextButton:
                self?.displayTermsOfServiceScreen()
            }
        }
        termsOfServiceViewModel.routeAction = { [weak self] action in
            switch action {
            case .didTapNextButton:
                self?.displayCredentialsScreen()
            }
        }
        credentialsViewModel.routeAction = { [weak self] action in
            switch action {
            case .didTapNextButton:
                self?.displayPersonalInfoScreen()
            }
        }
        personalInfoViewModel.routeAction = { [weak self] action in
            switch action {
            case .didTapNextButton:
                self?.displayNewPinScreen()
            }
        }
        newPinViewModel.routeAction = { [weak self] action in
            switch action {
            case .didTapNextButton:
                self?.displayConfirmPinScreen()
            }
        }
        confirmPinViewModel.routeAction = { [weak self] action in
            switch action {
            case .didTapNextButton:
                self?.completeFlow()
            }
        }
    }

    func makeRootScreen() {
        let screen = OnboardingCoordinator.Screen.welcome(welcomeViewModel)
        routes.presentSheet(screen, embedInNavigationView: true)
    }

    func displayTermsOfServiceScreen() {
        let screen = OnboardingCoordinator.Screen.termsOfService(termsOfServiceViewModel)
        routes.push(screen)
    }

    func displayCredentialsScreen() {
        let screen = OnboardingCoordinator.Screen.credentials(credentialsViewModel)
        routes.push(screen)
    }

    func displayPersonalInfoScreen() {
        let screen = OnboardingCoordinator.Screen.personalInfo(personalInfoViewModel)
        routes.push(screen)
    }

    func displayNewPinScreen() {
        let screen = OnboardingCoordinator.Screen.newPin(newPinViewModel)
        routes.push(screen)
    }

    func displayConfirmPinScreen() {
        let screen = OnboardingCoordinator.Screen.confirmPin(confirmPinViewModel)
        routes.push(screen)
    }

    func completeFlow() {
        didComplete?()
        Task { @MainActor in
            RouteSteps.withDelaysIfUnsupported(self, \.routes) {
                $0.goBackToRoot()
            }
        }
    }
}
