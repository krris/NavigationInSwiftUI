//
//  NavigationInSwiftUIApp.swift
//  NavigationInSwiftUI
//
//  Created by Krzysztof Werys on 05/06/2022.
//

import SwiftUI

@main
struct NavigationInSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            AppCoordinator(viewModel: AppCoordinatorViewModel())
        }
    }
}
