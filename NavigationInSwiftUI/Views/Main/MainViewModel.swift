//
//  MainViewModel.swift
//  NavigationInSwiftUI
//
//  Created by Krzysztof Werys on 07/06/2022.
//

import Foundation

class MainViewModel: ObservableObject {
    var userName: String = "[TODO]"
    var didTapSignOutButton: (() -> ())?
}
