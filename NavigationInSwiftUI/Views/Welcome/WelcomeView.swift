//
//  WelcomeView.swift
//  NavigationInSwiftUI
//
//  Created by Krzysztof Werys on 07/06/2022.
//

import SwiftUI

struct WelcomeView: View {
    @ObservedObject var viewModel: WelcomeViewModel

    var body: some View {
        VStack {
            Text("Welcome")
            Button("Next") {
                viewModel.didTapNextButton?()
            }
        }
    }
}
