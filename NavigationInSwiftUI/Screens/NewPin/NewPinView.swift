//
//  NewPinView.swift
//  NavigationInSwiftUI
//
//  Created by Krzysztof Werys on 07/06/2022.
//

import SwiftUI

struct NewPinView: View {
    @StateObject var viewModel: NewPinViewModel

    var body: some View {
        VStack {

            Form {
                Section(header: Text("🔐 Create new PIN")) {
                    SecureField("PIN", text: $viewModel.pin)
                        .keyboardType(.numberPad)
                }
            }

            Spacer()

            Button(action: {
                viewModel.didTapNextButton()
            }) {
                Text("Next")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .border(Color(UIColor.label), width: 1)
                    .padding()
            }
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
