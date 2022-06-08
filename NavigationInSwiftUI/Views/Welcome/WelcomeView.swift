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
            Spacer()
            Text("Welcome 👋")
                .font(.largeTitle)
                .foregroundColor(Color.black)
            Spacer()

            Button(action: {
                viewModel.didTapNextButton?()
            }) {
                Text("Continue")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .border(Color.black, width: 1)
                    .padding()
            }
        }
        .background(Color.white)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(viewModel: WelcomeViewModel())
    }
}
