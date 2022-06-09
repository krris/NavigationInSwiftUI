//
//  User.swift
//  NavigationInSwiftUI
//
//  Created by Krzysztof Werys on 08/06/2022.
//

import Foundation

struct User: Codable {
    var firstName: String = ""
    var lastName: String = ""
    var phoneNumber: String = ""
    var email: String = ""
    var password: String = ""
    var pin: String = ""
}
