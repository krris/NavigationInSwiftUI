//
//  SignedInCoordinator.swift
//  NavigationInSwiftUI
//
//  Created by Krzysztof Werys on 07/06/2022.
//

import SwiftUI
import FlowStacks

final class SignedInRoutesProvider: ObservableObject {
    @Published var routes: Routes<SignedInCoordinator.Screen> = []

    init() {
        displayMainScreen()
    }

    func displayMainScreen() {
        let viewModel = MainViewModel()
        viewModel.didTapSignOutButton = { [weak self] in
            print("Sign out")
        }
        let screen = SignedInCoordinator.Screen.main(viewModel)
        routes.push(screen)
    }
}


// Display main screen
struct SignedInCoordinator: View {
    @ObservedObject var routesProvider = SignedInRoutesProvider()

    enum Screen {
        case main(MainViewModel)
    }

    var body: some View {
        Router($routesProvider.routes) { screen, _ in
            switch screen {
            case .main(let viewModel):
                MainView(viewModel: viewModel)
            }
        }
    }
}
