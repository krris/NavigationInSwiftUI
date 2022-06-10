//
//  WelcomeViewModel.swift
//  NavigationInSwiftUI
//
//  Created by Krzysztof Werys on 07/06/2022.
//

import Foundation

protocol WelcomeViewModelProtocol {
    func didTapNextButton()
}

final class WelcomeViewModel: WelcomeViewModelProtocol {
    enum RouteAction {
        case didTapNextButton
    }

    var routeAction: ((RouteAction) -> Void)?

    func didTapNextButton() {
        routeAction?(.didTapNextButton)
    }
}
