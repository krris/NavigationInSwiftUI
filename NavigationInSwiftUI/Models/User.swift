//
//  User.swift
//  NavigationInSwiftUI
//
//  Created by Krzysztof Werys on 08/06/2022.
//

import Foundation

struct User: Codable {
    let firstName: String
    let lastName: String
    let phoneNumber: String
    let email: String
    let password: String
    let pin: String
}
