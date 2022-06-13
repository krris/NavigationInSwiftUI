//
//  OnboardingCoordinatorScreen+Extensions.swift
//  NavigationInSwiftUITests
//
//  Created by Krzysztof Werys on 12/06/2022.
//

@testable import NavigationInSwiftUI

extension OnboardingCoordinator.Screen {
    var isWelcome: Bool {
        switch self {
        case .welcome:
            return true
        default:
            return false
        }
    }

    var isTermsOfService: Bool {
        switch self {
        case .termsOfService:
            return true
        default:
            return false
        }
    }

    var isConfirmPin: Bool {
        switch self {
        case .confirmPin:
            return true
        default:
            return false
        }
    }

    var isCredentials: Bool {
        switch self {
        case .credentials:
            return true
        default:
            return false
        }
    }

    var isNewPin: Bool {
        switch self {
        case .newPin:
            return true
        default:
            return false
        }
    }

    var isPersonalInfo: Bool {
        switch self {
        case .personalInfo:
            return true
        default:
            return false
        }
    }
}
