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
}

struct AppCoordinator: View {
    enum Screen {
        case signedIn
        case onboarding
    }

    // TODO Inject
    @ObservedObject var appRoutesProvider = AppRoutesProvider()

    private let onboardingRoutesProvider: OnboardingRoutesProvider

    init() {
        // TODO inject
        onboardingRoutesProvider = OnboardingRoutesProvider()
        onboardingRoutesProvider.didComplete = { [appRoutesProvider] in
            appRoutesProvider.startSignedInCoordinator()
        }
    }

    var body: some View {
        Router($appRoutesProvider.routes) { screen, _ in
            switch screen {
            case .signedIn:
                SignedInCoordinator()
            case .onboarding:

                OnboardingCoordinator(routesProvider: onboardingRoutesProvider)
            }
        }
    }
}
