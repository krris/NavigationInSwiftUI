//
//  CredentialsViewModelTests.swift
//  NavigationInSwiftUITests
//
//  Created by Krzysztof Werys on 13/06/2022.
//

import XCTest
@testable import NavigationInSwiftUI

final class CredentialsViewModelTests: XCTestCase {

    var sut: CredentialsViewModel!
    var userRepositoryMock: UserRepositoryProtocolMock!
    var emailValidatingMock: EmailValidatingMock!
    var routeActionCalls: [CredentialsViewModel.RouteAction] = []


    override func setUpWithError() throws {
        userRepositoryMock = UserRepositoryProtocolMock()
        emailValidatingMock = EmailValidatingMock()
        routeActionCalls = []

        sut = CredentialsViewModel(
            userRepository: userRepositoryMock,
            emailValidator: emailValidatingMock
        )
        sut.routeAction = { [weak self] action in
            self?.routeActionCalls.append(action)
        }
    }

    func test_whenPasswordAndEmailAreValid_andTapsNextButton_callsRouteAction_andCreatesDrafUser() throws {
        emailValidatingMock.isValidEmail = true
        sut.email = "email@example.com"
        sut.password = "123123"

        sut.didTapNextButton()

        XCTAssertEqual(routeActionCalls, [.didTapNextButton])
        XCTAssertFalse(sut.isNextButtonDisabled)
        XCTAssertNotNil(userRepositoryMock.userDraft)
    }

    func test_whenPasswordIsInvalid_andTapsNextButton_doesntCallRouteAction() throws {
        emailValidatingMock.isValidEmail = true
        sut.email = "email@example.com"
        sut.password = ""

        sut.didTapNextButton()

        XCTAssertEqual(routeActionCalls, [])
        XCTAssertTrue(sut.isNextButtonDisabled)
    }

    func test_whenEmailIsInvalid_andTapsNextButton_doesntCallRouteAction() throws {
        emailValidatingMock.isValidEmail = false
        sut.email = "email@example.com"
        sut.password = "123123"

        sut.didTapNextButton()

        XCTAssertEqual(routeActionCalls, [])
        XCTAssertTrue(sut.isNextButtonDisabled)
    }
}
