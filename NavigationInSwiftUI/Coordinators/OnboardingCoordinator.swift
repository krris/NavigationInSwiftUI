//
//  OnboardingCoordinator.swift
//  NavigationInSwiftUI
//
//  Created by Krzysztof Werys on 07/06/2022.
//

import SwiftUI
import FlowStacks

class OnboardingRoutesProvider: ObservableObject {
    @Published var routes: Routes<OnboardingCoordinator.Screen> = []

    var didComplete: (() -> ())?

    init() {
        let viewModel = WelcomeViewModel()
        viewModel.didTapNextButton = { [weak self] in
            self?.displayTermsOfServiceScreen()
        }
        let screen = OnboardingCoordinator.Screen.welcome(viewModel)
        routes.presentSheet(screen, embedInNavigationView: true)
    }

    private func displayTermsOfServiceScreen() {
        let viewModel = TermsOfServiceViewModel()
        viewModel.didTapNextButton = { [weak self] in
            self?.displayCredentialsScreen()
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

struct OnboardingCoordinator: View {
    @ObservedObject var routesProvider: OnboardingRoutesProvider

    enum Screen {
        case welcome(WelcomeViewModel)
        case termsOfService(TermsOfServiceViewModel)
        case credentials(CredentialsViewModel)
        case personalInfo(PersonalInfoViewModel)
        case newPin(NewPinViewModel)
        case confirmPin(ConfirmPinViewModel)
    }

    var body: some View {
        Router($routesProvider.routes) { screen, _ in
            switch screen {
            case .welcome(let viewModel):
                WelcomeView(viewModel: viewModel)
            case .termsOfService(let viewModel):
                TermsOfServiceView(viewModel: viewModel)
            case .credentials(let viewModel):
                CredentialsView(viewModel: viewModel)
            case .personalInfo(let viewModel):
                PersonalInfoView(viewModel: viewModel)
            case .newPin(let viewModel):
                NewPinView(viewModel: viewModel)
            case .confirmPin(let viewModel):
                ConfirmPinView(viewModel: viewModel)
            }
        }
    }
}
