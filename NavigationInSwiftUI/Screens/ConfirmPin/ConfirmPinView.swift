//
//  ConfirmPinView.swift
//  NavigationInSwiftUI
//
//  Created by Krzysztof Werys on 07/06/2022.
//

import SwiftUI

struct ConfirmPinView<ViewModel: ConfirmPinViewModel>: View {
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        VStack {
            Form {
                Section(header: Text("🔍 Confirm your PIN")) {
                    SecureField("PIN", text: $viewModel.confirmedPin)
                        .keyboardType(.numberPad)
                }
            }

            Spacer()

            Button(
                action: {
                    viewModel.didTapNextButton()
                }, label: {
                    Text("Confirm")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .border(Color(UIColor.label), width: 1)
                        .padding()
                })
                .disabled(viewModel.isNextButtonDisabled)
        }
        .navigationTitle("Confirm PIN")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ConfirmPinView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmPinView(viewModel: ConfirmPinViewModel())
    }
}
