//
//  EmailValidatingMock.swift
//  NavigationInSwiftUITests
//
//  Created by Krzysztof Werys on 13/06/2022.
//

import Foundation
@testable import NavigationInSwiftUI

final class EmailValidatingMock: EmailValidating {

    var isValidEmail: Bool = false
    func isValid(_ text: String) -> Bool {
        isValidEmail
    }
}
