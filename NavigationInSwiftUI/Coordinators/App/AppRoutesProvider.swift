//
//  AppRoutesProvider.swift
//  NavigationInSwiftUI
//
//  Created by Krzysztof Werys on 10/06/2022.
//

import Combine
import FlowStacks

final class AppRoutesProvider: ObservableObject {
    @Published var routes: Routes<AppCoordinator.Screen> = []

    init(userRepository: UserRepositoryProtocol = UserRepository.shared) {
        if userRepository.isSignedIn {
            startSignedInCoordinator()
        } else {
            startOnboardingCoordinator()
        }
    }

    func startSignedInCoordinator() {
        routes = [.root(.signedIn)]
    }

    func startOnboardingCoordinator() {
        routes = [.root(.onboarding)]
    }
}
