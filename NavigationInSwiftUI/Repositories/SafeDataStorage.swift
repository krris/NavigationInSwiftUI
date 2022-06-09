//
//  SafeDataStorage.swift
//  NavigationInSwiftUI
//
//  Created by Krzysztof Werys on 08/06/2022.
//

import Foundation

final class SafeDataStorage {

    // TODO: inject
    private let userDefaults = UserDefaults.standard

    func save<CodableObject: Encodable>(data: CodableObject, for key: String) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(data) {
            userDefaults.set(encoded, forKey: key)
        }
    }

    func getData<CodableObject: Decodable>(for key: String) -> CodableObject? {
        guard let savedObject = userDefaults.object(forKey: key) as? Data else {
            return nil
        }

        let decoder = JSONDecoder()
        return try? decoder.decode(CodableObject.self, from: savedObject)
    }
}