//
//  TermsOfServiceViewModel.swift
//  NavigationInSwiftUI
//
//  Created by Krzysztof Werys on 07/06/2022.
//

import Foundation
import SwiftUI

protocol TermsOfServiceViewModelProtocol: ObservableObject {
    var areTermsAccepted: Bool { get set }
    func didTapNextButton()
}

final class TermsOfServiceViewModel: TermsOfServiceViewModelProtocol {
    enum RouteAction {
        case didTapNextButton
    }

    var routeAction: ((RouteAction) -> Void)?

    @Published var areTermsAccepted: Bool = false

    func didTapNextButton() {
        routeAction?(.didTapNextButton)
    }
}
