//
//  ConfirmPinViewModel.swift
//  NavigationInSwiftUI
//
//  Created by Krzysztof Werys on 07/06/2022.
//

import Combine

class ConfirmPinViewModel: ObservableObject {
    @Published var confirmedPin: String = ""

    var didTapNextButton: (() -> ())?

    var isNextButtonDisabled: Bool {
        // TODO: compare with a previously saved
        confirmedPin != "7777"
    }
}
