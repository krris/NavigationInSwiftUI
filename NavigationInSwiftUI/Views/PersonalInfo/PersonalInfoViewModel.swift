//
//  PersonalInfoViewModel.swift
//  NavigationInSwiftUI
//
//  Created by Krzysztof Werys on 07/06/2022.
//

import Combine

class PersonalInfoViewModel: ObservableObject {
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var phoneNumber: String = ""

    var didTapNextButton: (() -> ())?

    var isNextButtonDisabled: Bool {
        firstName.isEmpty ||
        lastName.isEmpty ||
        phoneNumber.isEmpty
    }
}
