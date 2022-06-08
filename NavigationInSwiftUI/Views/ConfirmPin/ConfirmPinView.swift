//
//  ConfirmPinView.swift
//  NavigationInSwiftUI
//
//  Created by Krzysztof Werys on 07/06/2022.
//

import SwiftUI

struct ConfirmPinView: View {
    @ObservedObject var viewModel: ConfirmPinViewModel

    var body: some View {
        VStack {
            Text("Confirm")
            Button("Next") {
                viewModel.didTapNextButton?()
            }
        }
    }
}

struct ConfirmPinView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmPinView(viewModel: ConfirmPinViewModel())
    }
}
