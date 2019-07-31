//
//  JSONHelper.swift
//  MarvelAppTests
//
//  Created by Renato Matos de Paula on 30/07/19.
//  Copyright © 2019 Renato Matos de Paula. All rights reserved.
//

import UIKit

class JSONHelper {
    static func getDataFrom(json file: String) -> Data? {
        if let path = Bundle(for: JSONHelper.self).path(forResource: file, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                return data
            } catch {
                fatalError("Wrong Format JSON")
            }
        }
        fatalError("Wrong Format JSON")
    }
    
    static func getObjectFrom<T: Codable>(json file: String, type: T.Type) -> T? {
        guard let jsonData = getDataFrom(json: file) else { return nil }
        if let objDecoded = try? JSONDecoder().decode(T.self, from: jsonData) {
            return objDecoded
        }
        return nil
    }
}
