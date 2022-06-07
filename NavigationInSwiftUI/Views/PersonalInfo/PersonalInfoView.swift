//
//  PersonalInfoView.swift
//  NavigationInSwiftUI
//
//  Created by Krzysztof Werys on 07/06/2022.
//

import SwiftUI

struct PersonalInfoView: View {
    @ObservedObject var viewModel: PersonalInfoViewModel

    var body: some View {
        VStack {
            Text("PersonalInfoView")
            Button("Next") {
                viewModel.didTapNextButton?()
            }
        }
    }
}
