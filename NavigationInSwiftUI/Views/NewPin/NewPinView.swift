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
            .background(Color.white)

            Spacer()

            Button(action: {
                viewModel.didTapNextButton?()
            }) {
                Text("Next")
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

struct NewPinView_Previews: PreviewProvider {
    static var previews: some View {
        NewPinView(viewModel: NewPinViewModel())
    }
}
