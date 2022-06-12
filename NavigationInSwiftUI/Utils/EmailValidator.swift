//
//  EmailValidator.swift
//  NavigationInSwiftUI
//
//  Created by Krzysztof Werys on 12/06/2022.
//

import Foundation

protocol EmailValidating {
    func isValid(_ text: String) -> Bool
}

struct EmailValidator: EmailValidating {

    func isValid(_ text: String) -> Bool {
        let emailPattern = #"^\S+@\S+\.\S+$"#

        let result = text.range(
            of: emailPattern,
            options: .regularExpression
        )

        let isValid = result != nil

        return isValid
    }
}
