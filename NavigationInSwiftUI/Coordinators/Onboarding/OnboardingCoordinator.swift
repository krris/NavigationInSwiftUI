//
//  OnboardingCoordinator.swift
//  NavigationInSwiftUI
//
//  Created by Krzysztof Werys on 07/06/2022.
//

import SwiftUI
import FlowStacks

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
