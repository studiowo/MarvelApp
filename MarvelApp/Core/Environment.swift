//
//  Environment.swift
//  MarvelApp
//
//  Created by Renato Matos de Paula on 29/07/19.
//  Copyright © 2019 Renato Matos de Paula. All rights reserved.
//

import Foundation

struct Environment {
    static var baseUrl: String {
        guard let info = Bundle.main.infoDictionary, let url = info["BASE_URL"] as? String else {
            return ""
        }
        
        guard let rawValue = getenv("BASE_URL_TEST"), let urlTest = String(utf8String: rawValue) else { return url }
        return urlTest
    }
    
    static var publicKey: String {
        guard let info = Bundle.main.infoDictionary, let url = info["PUBLIC_API_KEY"] as? String else {
            return ""
        }
        
        return url
    }
    
    static var privateKey: String {
        guard let info = Bundle.main.infoDictionary, let url = info["PRIVATE_API_KEY"] as? String else {
            return ""
        }
        
        return url
    }
}
