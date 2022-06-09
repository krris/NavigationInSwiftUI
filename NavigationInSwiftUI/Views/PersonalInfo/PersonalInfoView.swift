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
            Form {
                Section(header: Text("👩‍💻 Personal information")) {
                    TextField("First name", text: $viewModel.firstName)
                    TextField("Last name", text: $viewModel.lastName)
                    TextField("Phone number", text: $viewModel.phoneNumber)
                        .keyboardType(.phonePad)
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
        .navigationTitle("Personal Information")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PersonalInfoView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalInfoView(viewModel: PersonalInfoViewModel())
    }
}
