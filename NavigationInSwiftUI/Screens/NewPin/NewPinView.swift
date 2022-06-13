//
//  NewPinView.swift
//  NavigationInSwiftUI
//
//  Created by Krzysztof Werys on 07/06/2022.
//

import SwiftUI

struct NewPinView<ViewModel: NewPinViewModelProtocol>: View {
    @StateObject var viewModel: ViewModel

    var body: some View {
        VStack {

            Form {
                Section(header: Text("🔐 Create new PIN")) {
                    SecureField("PIN", text: $viewModel.pin)
                        .keyboardType(.numberPad)
                }
            }

            Spacer()

            Button(
                action: {
                    viewModel.didTapNextButton()
                }, label: {
                    Text("Next")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .border(Color(UIColor.label), width: 1)
                        .padding()
                })
                .disabled(viewModel.isNextButtonDisabled)
        }
        .navigationTitle("New PIN")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct NewPinView_Previews: PreviewProvider {
    static var previews: some View {
        NewPinView(viewModel: NewPinViewModel())
    }
}
