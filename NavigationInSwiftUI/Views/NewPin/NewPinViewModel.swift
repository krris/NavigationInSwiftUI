//
//  NewPinViewModel.swift
//  NavigationInSwiftUI
//
//  Created by Krzysztof Werys on 07/06/2022.
//

import Combine

class NewPinViewModel: ObservableObject {
    @Published var pin: String = ""

    var didTapNextButton: (() -> ())?

    var isNextButtonDisabled: Bool {
        pin.isEmpty
    }
}
