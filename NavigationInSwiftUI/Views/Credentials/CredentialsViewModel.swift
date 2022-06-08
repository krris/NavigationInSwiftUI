//
//  CredentialsViewModel.swift
//  NavigationInSwiftUI
//
//  Created by Krzysztof Werys on 07/06/2022.
//

import Combine

class CredentialsViewModel: ObservableObject {
    @Published var password: String = ""
    @Published var email: String = ""

    var didTapNextButton: (() -> ())?

    var isNextButtonDisabled: Bool {
        email.isEmpty || password.isEmpty
    }
}
