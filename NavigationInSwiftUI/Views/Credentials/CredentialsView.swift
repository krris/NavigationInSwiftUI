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
            TextField("Enter your email", text: $email)
            SecureField("Enter a password", text: $password)
            Button("Next") {
                viewModel.didTapNextButton?()
            }
        }
    }
}
