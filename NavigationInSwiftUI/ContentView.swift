//
//  ContentView.swift
//  NavigationInSwiftUI
//
//  Created by Krzysztof Werys on 05/06/2022.
//

import SwiftUI
import FlowStacks

enum Screen {
    case welcome(WelcomeViewModel)
    case termsOfService(TermsOfServiceViewModel)
    case credentials(CredentialsViewModel)
//    case personalInfo
//    case newPin
//    case confirmPin
//    case main
}

class AppCoordinatorViewModel: ObservableObject {
    @Published var routes: Routes<Screen> = []

    init() {
        // TODO: if - welcome vs main
        let viewModel = WelcomeViewModel()
        viewModel.didTapNextButton = { [weak self] in
            self?.displayTermsOfServiceScreen()
        }
        let screen = Screen.welcome(viewModel)
        routes.presentSheet(screen, embedInNavigationView: true)
    }

    func displayTermsOfServiceScreen() {
        let viewModel = TermsOfServiceViewModel()
        viewModel.didTapNextButton = { [weak self] in
            self?.displayCredentialsScreen()
        }
        let screen = Screen.termsOfService(viewModel)
        routes.push(screen)
    }

    func displayCredentialsScreen() {
        let viewModel = CredentialsViewModel()
        viewModel.didTapNextButton = { [weak self] in
            print("TODO")
        }
        let screen = Screen.credentials(viewModel)
        routes.push(screen)
    }
}

struct AppCoordinator: View {
    // TODO Inject
    @ObservedObject var viewModel = AppCoordinatorViewModel()

    var body: some View {
        Router($viewModel.routes) { screen, _ in
            switch screen {
            case .welcome(let viewModel):
                WelcomeView(viewModel: viewModel)
            case .termsOfService(let viewModel):
                TermsOfServiceView(viewModel: viewModel)
            case .credentials(let viewModel):
                CredentialsView(viewModel: viewModel)
            }
        }
    }
}

class WelcomeViewModel: ObservableObject {
    var didTapNextButton: (() -> ())?
}

class TermsOfServiceViewModel: ObservableObject {
    var didTapNextButton: (() -> ())?
}

class CredentialsViewModel: ObservableObject {
    var didTapNextButton: (() -> ())?
}

struct WelcomeView: View {
    @ObservedObject var viewModel: WelcomeViewModel

    var body: some View {
        VStack {
            Text("Welcome")
            Button("Next") {
                viewModel.didTapNextButton?()
            }
        }
    }
}

struct TermsOfServiceView: View {
    @ObservedObject var viewModel: TermsOfServiceViewModel
    @State private var areTermsAccepted = false

    var body: some View {
        VStack {
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
            Toggle("Accept", isOn: $areTermsAccepted)
            Button("Next") {
                viewModel.didTapNextButton?()
            }
        }
    }
}

struct CredentialsView: View {
    @ObservedObject var viewModel: CredentialsViewModel
    @State private var password: String = ""
    @State private var email: String = ""

    var body: some View {
        VStack {
            TextField("Enter your email", text: $email)
            SecureField("Enter a password", text: $password)
            Button("Next") {
                viewModel.didTapNextButton?()
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TermsOfServiceView(viewModel: TermsOfServiceViewModel())
        CredentialsView(viewModel: CredentialsViewModel())
    }
}
