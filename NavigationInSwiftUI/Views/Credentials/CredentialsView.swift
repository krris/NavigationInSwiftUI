//
//  CredentialsView.swift
//  NavigationInSwiftUI
//
//  Created by Krzysztof Werys on 07/06/2022.
//

import SwiftUI

struct CredentialsView: View {
    @StateObject var viewModel: CredentialsViewModel

    var body: some View {
        VStack {

            Form {
                Section(header: Text("🔐 Account details")) {
                    TextField("Email", text: $viewModel.email)
                    SecureField("Password", text: $viewModel.password)
                }
            }

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
            .disabled(viewModel.isNextButtonDisabled)
        }
        .navigationTitle("Account details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CredentialsView_Previews: PreviewProvider {
    static var previews: some View {
        CredentialsView(viewModel: CredentialsViewModel())
    }
}
