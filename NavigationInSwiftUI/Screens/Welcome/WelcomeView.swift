//
//  WelcomeView.swift
//  NavigationInSwiftUI
//
//  Created by Krzysztof Werys on 07/06/2022.
//

import SwiftUI

struct WelcomeView: View {
    let viewModel: WelcomeViewModel

    var body: some View {
        VStack {
            Spacer()
            Text("Welcome 👋")
                .font(.largeTitle)
            Spacer()

            Button(action: {
                viewModel.didTapNextButton()
            }) {
                Text("Continue")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .border(Color(UIColor.label), width: 1)
                    .padding()
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(viewModel: WelcomeViewModel())
    }
}
