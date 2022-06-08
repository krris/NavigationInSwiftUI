//
//  MainView.swift
//  NavigationInSwiftUI
//
//  Created by Krzysztof Werys on 07/06/2022.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel: MainViewModel

    var body: some View {

        VStack {
            Spacer()
            Text("Hello \(viewModel.userName)👋")
                .font(.largeTitle)
                .foregroundColor(Color.black)
            Spacer()

            Button(action: {
                viewModel.didTapSignOutButton?()
            }) {
                Text("Sign out")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .border(Color.black, width: 1)
                    .padding()
            }
        }
        .background(Color.white)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainViewModel())
    }
}
