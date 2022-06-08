//
//  AppCoordinator.swift
//  NavigationInSwiftUI
//
//  Created by Krzysztof Werys on 07/06/2022.
//

import SwiftUI
import FlowStacks

final class AppRoutesProvider: ObservableObject {
    @Published var routes: Routes<AppCoordinator.Screen> = [.root(.onboarding)]

    init() {
        // TODO: decide if onboarding or welcome
    }

    func startSignedInCoordinator() {
        routes = [.root(.signedIn)]
    }

    func startOnboardingCoordinator() {
        routes = [.root(.onboarding)]
    }
}

struct AppCoordinator: View {
    enum Screen {
        case signedIn
        case onboarding
    }

    // TODO Inject
    @ObservedObject var appRoutesProvider = AppRoutesProvider()

    private let onboardingRoutesProvider: OnboardingRoutesProvider
    private let signedInRoutesProvider: SignedInRoutesProvider

    init() {
        // TODO inject
        onboardingRoutesProvider = OnboardingRoutesProvider()
        signedInRoutesProvider = SignedInRoutesProvider()

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