//
//  NewPinView.swift
//  NavigationInSwiftUI
//
//  Created by Krzysztof Werys on 07/06/2022.
//

import SwiftUI

struct NewPinView: View {
    @ObservedObject var viewModel: NewPinViewModel

    var body: some View {
        VStack {
            Text("NewPinView")
            Button("Next") {
                viewModel.didTapNextButton?()
            }
        }
    }
}

struct NewPinView_Previews: PreviewProvider {
    static var previews: some View {
        NewPinView(viewModel: NewPinViewModel())
    }
}
