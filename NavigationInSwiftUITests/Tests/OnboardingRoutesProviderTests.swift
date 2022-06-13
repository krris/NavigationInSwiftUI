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
    var didCompleteCallsCount: Int = 0

    var sut: OnboardingRoutesProvider!

    override func setUp() {
        super.setUp()

        welcomeViewModel = WelcomeViewModel()
        termsOfServiceViewModel = TermsOfServiceViewModel()
        credentialsViewModel = CredentialsViewModel(userRepository: UserRepositoryProtocolMock())
        personalInfoViewModel = PersonalInfoViewModel(userRepository: UserRepositoryProtocolMock())
        newPinViewModel = NewPinViewModel(userRepository: UserRepositoryProtocolMock())
        confirmPinViewModel = ConfirmPinViewModel(userRepository: UserRepositoryProtocolMock())

        sut = OnboardingRoutesProvider(
            welcomeViewModel: welcomeViewModel,
            termsOfServiceViewModel: termsOfServiceViewModel,
            credentialsViewModel: credentialsViewModel,
            personalInfoViewModel: personalInfoViewModel,
            newPinViewModel: newPinViewModel,
            confirmPinViewModel: confirmPinViewModel
        )
        sut.didComplete = { [weak self] in
            self?.didCompleteCallsCount += 1
        }
    }

    func test_ifWelcomeScreenIsTheFirstScreen() {
        XCTAssertEqual(sut.routes.count, 1)
        let route = sut.routes.last!
        XCTAssertTrue(route.screen.isWelcome)
        debugPrint(sut.routes)
    }

    func test_whenTapsOnNextButton_onWelcomeScreen_navigatesToTermsOfService() {
        welcomeViewModel.routeAction?(.didTapNextButton)

        XCTAssertEqual(sut.routes.count, 2)
        let route = sut.routes.last!
        XCTAssertTrue(route.screen.isTermsOfService)
        print(sut.routes)
    }

    func test_whenTapsOnNextButton_onTermsOfService_navigatesToCredentials() {
        welcomeViewModel.routeAction?(.didTapNextButton)
        termsOfServiceViewModel.routeAction?(.didTapNextButton)

        XCTAssertEqual(sut.routes.count, 3)
        let route = sut.routes.last!
        XCTAssertTrue(route.screen.isCredentials)
        print(sut.routes)
    }

    func test_whenTapsOnNextButton_onCredentials_navigatesToPersonalInfo() {
        welcomeViewModel.routeAction?(.didTapNextButton)
        termsOfServiceViewModel.routeAction?(.didTapNextButton)
        credentialsViewModel.routeAction?(.didTapNextButton)

        XCTAssertEqual(sut.routes.count, 4)
        let route = sut.routes.last!
        XCTAssertTrue(route.screen.isPersonalInfo)
        print(sut.routes)
    }

    func test_whenTapsOnNextButton_onPersonalInfo_navigatesToNewPin() {
        welcomeViewModel.routeAction?(.didTapNextButton)
        termsOfServiceViewModel.routeAction?(.didTapNextButton)
        credentialsViewModel.routeAction?(.didTapNextButton)
        personalInfoViewModel.routeAction?(.didTapNextButton)

        XCTAssertEqual(sut.routes.count, 5)
        let route = sut.routes.last!
        XCTAssertTrue(route.screen.isNewPin)
    }

    func test_whenTapsOnNextButton_onNewPin_navigatesToConfirmPin() {
        welcomeViewModel.didTapNextButton()
        termsOfServiceViewModel.routeAction?(.didTapNextButton)
        credentialsViewModel.routeAction?(.didTapNextButton)
        personalInfoViewModel.routeAction?(.didTapNextButton)
        newPinViewModel.routeAction?(.didTapNextButton)

        XCTAssertEqual(sut.routes.count, 6)
        let route = sut.routes.last!
        XCTAssertTrue(route.screen.isConfirmPin)
    }

    func test_whenTapsOnNextButton_onConfirmPin_completesTheFlow() {
        welcomeViewModel.didTapNextButton()
        termsOfServiceViewModel.routeAction?(.didTapNextButton)
        credentialsViewModel.routeAction?(.didTapNextButton)
        personalInfoViewModel.routeAction?(.didTapNextButton)
        newPinViewModel.routeAction?(.didTapNextButton)
        confirmPinViewModel.routeAction?(.didTapNextButton)

        XCTAssertEqual(didCompleteCallsCount, 1)
    }
}
