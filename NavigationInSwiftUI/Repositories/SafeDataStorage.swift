//
//  SafeDataStorage.swift
//  NavigationInSwiftUI
//
//  Created by Krzysztof Werys on 08/06/2022.
//

import Foundation

protocol SafeDataStoring {
    func save<CodableObject: Encodable>(data: CodableObject, for key: String)
    func removeObject(for key: String)
    func getData<CodableObject: Decodable>(for key: String) -> CodableObject?
}

final class SafeDataStorage: SafeDataStoring {

    // UserDefaults are used here to keep this assignment easy. In a production app it's not the best idea to keep passwords in UserDefaults :)
    private let userDefaults: UserDefaultsProtocol

    init(userDefaults: UserDefaultsProtocol = UserDefaults.standard) {
        self.userDefaults = userDefaults
    }

    func save<CodableObject: Encodable>(data: CodableObject, for key: String) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(data) {
            userDefaults.set(encoded, forKey: key)
        }
    }

    func removeObject(for key: String) {
        userDefaults.removeObject(forKey: key)
    }

    func getData<CodableObject: Decodable>(for key: String) -> CodableObject? {
        guard let savedObject = userDefaults.object(forKey: key) as? Data else {
            return nil
        }

        let decoder = JSONDecoder()
        return try? decoder.decode(CodableObject.self, from: savedObject)
    }
}
