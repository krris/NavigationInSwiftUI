//
//  MainView.swift
//  NavigationInSwiftUI
//
//  Created by Krzysztof Werys on 07/06/2022.
//

import SwiftUI

struct MainView: View {
    let viewModel: MainViewModelProtocol

    var body: some View {

        VStack {
            Spacer()
            Text("Hello \(viewModel.userName)👋")
                .font(.largeTitle)
            Spacer()

            Button(action: {
                viewModel.didTapSignOutButton()
            }) {
                Text("Sign out")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .border(Color(UIColor.label), width: 1)
                    .padding()
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainViewModel())
    }
}
