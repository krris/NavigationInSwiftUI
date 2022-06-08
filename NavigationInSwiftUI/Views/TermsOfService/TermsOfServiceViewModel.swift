//
//  TermsOfServiceViewModel.swift
//  NavigationInSwiftUI
//
//  Created by Krzysztof Werys on 07/06/2022.
//

import Foundation
import SwiftUI

class TermsOfServiceViewModel: ObservableObject {
    var didTapNextButton: (() -> ())?

    @Published var areTermsAccepted: Bool = false
}
