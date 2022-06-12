//
//  AppCoordinator.swift
//  NavigationInSwiftUI
//
//  Created by Krzysztof Werys on 07/06/2022.
//

import SwiftUI
import FlowStacks

struct AppCoordinator: View {
    enum Screen {
        case signedIn
        case onboarding
    }

    @ObservedObject var appRoutesProvider = AppRoutesProvider()

    let onboardingRoutesProvider = OnboardingRoutesProvider()
    let signedInRoutesProvider = SignedInRoutesProvider()

    init() {
        onboardingRoutesProvider.didComplete = { [appRoutesProvider] in
            appRoutesProvider.startSignedInCoordinator()
        }

        signedInRoutesProvider.didComplete = { [appRoutesProvider] in
            appRoutesProvider.startOnboardingCoordinator()
        }
    }

    var body: some View {
        Router($appRoutesProvider.routes) { screen, _ in
            switch screen {
            case .signedIn:
                SignedInCoordinator(routesProvider: signedInRoutesProvider)
            case .onboarding:
                OnboardingCoordinator(routesProvider: onboardingRoutesProvider)
            }
        }
    }
}
