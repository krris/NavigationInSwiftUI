//
//  SignedInCoordinator.swift
//  NavigationInSwiftUI
//
//  Created by Krzysztof Werys on 07/06/2022.
//

import SwiftUI
import FlowStacks


struct SignedInCoordinator: View {
    @ObservedObject var routesProvider: SignedInRoutesProvider

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
