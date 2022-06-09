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
            Form {
                Section(header: Text("🔍 Confirm your PIN")) {
                    SecureField("PIN", text: $viewModel.confirmedPin)
                        .keyboardType(.numberPad)
                }
            }
            .background(Color.white)

            Spacer()

            Button(action: {
                viewModel.didTapNextButton()
            }) {
                Text("Confirm")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .border(Color.black, width: 1)
                    .padding()
            }
            .disabled(viewModel.isNextButtonDisabled)
        }
        .background(Color.white)
    }
}

struct ConfirmPinView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmPinView(viewModel: ConfirmPinViewModel())
    }
}
