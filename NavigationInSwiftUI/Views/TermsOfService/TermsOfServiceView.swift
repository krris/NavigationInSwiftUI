//
//  TermsOfServiceView.swift
//  NavigationInSwiftUI
//
//  Created by Krzysztof Werys on 07/06/2022.
//

import SwiftUI

struct TermsOfServiceView: View {
    @ObservedObject var viewModel: TermsOfServiceViewModel
    @State private var areTermsAccepted = false

    var body: some View {
        VStack {
            VStack{
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                    .foregroundColor(Color.black)

                Toggle(isOn: $areTermsAccepted) {
                    Text("Accept")
                        .foregroundColor(Color.black)
                }
            }
            .padding()

            Spacer()

            Button(action: {
                viewModel.didTapNextButton?()
            }) {
                Text("Next")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .border(Color.black, width: 1)
                    .padding()
            }
        }
        .background(Color.white)
    }
}

struct TermsOfServiceView_Previews: PreviewProvider {
    static var previews: some View {
        TermsOfServiceView(viewModel: TermsOfServiceViewModel())
    }
}
