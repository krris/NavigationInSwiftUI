//
//  TermsOfServiceView.swift
//  NavigationInSwiftUI
//
//  Created by Krzysztof Werys on 07/06/2022.
//

import SwiftUI

struct TermsOfServiceView<ViewModel: TermsOfServiceViewModelProtocol>: View {
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            VStack{
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")

                Toggle(isOn: $viewModel.areTermsAccepted) {
                    Text("Accept")
                }
            }
            .padding()

            Spacer()

            Button(action: {
                viewModel.didTapNextButton()
            }) {
                Text("Next")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .border(Color(UIColor.label), width: 1)
                    .padding()
            }
            .disabled(viewModel.areTermsAccepted == false)
        }
        .navigationTitle("Terms of Service")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TermsOfServiceView_Previews: PreviewProvider {
    static var previews: some View {
        TermsOfServiceView(viewModel: TermsOfServiceViewModel())
    }
}
