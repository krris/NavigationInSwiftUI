//
//  CredentialsView.swift
//  NavigationInSwiftUI
//
//  Created by Krzysztof Werys on 07/06/2022.
//

import SwiftUI

struct CredentialsView: View {
    @ObservedObject var viewModel: CredentialsViewModel
    @State private var password: String = ""
    @State private var email: String = ""

    var body: some View {
            VStack {

                Form {
                    Section(header: Text("🔐 Account details")) {
                        TextField("Email", text: $email)
                        SecureField("Password", text: $password)
                    }
                }
                .background(Color.white)

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

struct CredentialsView_Previews: PreviewProvider {
    static var previews: some View {
        CredentialsView(viewModel: CredentialsViewModel())
    }
}
