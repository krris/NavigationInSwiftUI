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

    private var userRepository: UserRepositoryProtocol = UserRepository.shared

    init() {
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
