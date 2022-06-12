//
//  NavigationInSwiftUITests.swift
//  NavigationInSwiftUITests
//
//  Created by Krzysztof Werys on 05/06/2022.
//

import XCTest
import FlowStacks
@testable import NavigationInSwiftUI

final class OnboardingRoutesProviderTests: XCTestCase {

    var welcomeViewModel: WelcomeViewModel!
    var termsOfServiceViewModel: TermsOfServiceViewModel!
    var credentialsViewModel: CredentialsViewModel!
    var personalInfoViewModel: PersonalInfoViewModel!
    var newPinViewModel: NewPinViewModel!
    var confirmPinViewModel: ConfirmPinViewModel!

    var sut: OnboardingRoutesProvider!

    override func setUp() {
        super.setUp()

        welcomeViewModel = WelcomeViewModel()
        termsOfServiceViewModel = TermsOfServiceViewModel()
        credentialsViewModel = CredentialsViewModel(userRepository: UserRepositoryProtocolStub())
        personalInfoViewModel = PersonalInfoViewModel(userRepository: UserRepositoryProtocolStub())
        newPinViewModel = NewPinViewModel(userRepository: UserRepositoryProtocolStub())
        confirmPinViewModel = ConfirmPinViewModel(userRepository: UserRepositoryProtocolStub())

        sut = OnboardingRoutesProvider(
            welcomeViewModel: welcomeViewModel,
            termsOfServiceViewModel: termsOfServiceViewModel,
            credentialsViewModel: credentialsViewModel,
            personalInfoViewModel: personalInfoViewModel,
            newPinViewModel: newPinViewModel,
            confirmPinViewModel: confirmPinViewModel
        )
    }

    func test_ifFirstScreen_isWelcomeScreen() {
        XCTAssertEqual(sut.routes.count, 1)
        let route = sut.routes.last!
        XCTAssertTrue(route.screen.isWelcome)
        debugPrint(sut.routes)
    }

    func test_ifOpensTermsOfServiceScreen_fromWelcomeScreen() {
        welcomeViewModel.routeAction?(.didTapNextButton)

        XCTAssertEqual(sut.routes.count, 2)
        let route = sut.routes.last!
        XCTAssertTrue(route.screen.isTermsOfService)
        print(sut.routes)
    }

    func test_ifOpensCredentialsScreen_fromTermsOfService() {
        welcomeViewModel.routeAction?(.didTapNextButton)
        termsOfServiceViewModel.routeAction?(.didTapNextButton)

        XCTAssertEqual(sut.routes.count, 3)
        let route = sut.routes.last!
        XCTAssertTrue(route.screen.isCredentials)
        print(sut.routes)
    }

    func test_ifOpensPersonalInfoScreen_fromCredentials() {
        welcomeViewModel.routeAction?(.didTapNextButton)
        termsOfServiceViewModel.routeAction?(.didTapNextButton)
        credentialsViewModel.routeAction?(.didTapNextButton)

        XCTAssertEqual(sut.routes.count, 4)
        let route = sut.routes.last!
        XCTAssertTrue(route.screen.isPersonalInfo)
        print(sut.routes)
    }

    func test_ifOpensNewPinScreen_fromPersonalInfo() {
        welcomeViewModel.routeAction?(.didTapNextButton)
        termsOfServiceViewModel.routeAction?(.didTapNextButton)
        credentialsViewModel.routeAction?(.didTapNextButton)
        personalInfoViewModel.routeAction?(.didTapNextButton)

        XCTAssertEqual(sut.routes.count, 5)
        let route = sut.routes.last!
        XCTAssertTrue(route.screen.isNewPin)
    }

    func test_ifOpensConfirmPinScreen_fromNewPin() {
        welcomeViewModel.didTapNextButton()
        termsOfServiceViewModel.routeAction?(.didTapNextButton)
        credentialsViewModel.routeAction?(.didTapNextButton)
        personalInfoViewModel.routeAction?(.didTapNextButton)
        newPinViewModel.routeAction?(.didTapNextButton)

        XCTAssertEqual(sut.routes.count, 6)
        let route = sut.routes.last!
        XCTAssertTrue(route.screen.isConfirmPin)
    }
}
