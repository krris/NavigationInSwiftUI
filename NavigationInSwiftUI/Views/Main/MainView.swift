//
//  MainView.swift
//  NavigationInSwiftUI
//
//  Created by Krzysztof Werys on 07/06/2022.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel: MainViewModel

    var body: some View {
        VStack {
            Text("Main")
            Button("Sign out") {
                viewModel.didTapSignOutButton?()
            }
        }
    }
}
