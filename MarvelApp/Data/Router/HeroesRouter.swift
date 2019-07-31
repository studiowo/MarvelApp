//
//  HeroesRouter.swift
//  MarvelApp
//
//  Created by Renato Matos de Paula on 30/07/19.
//  Copyright © 2019 Renato Matos de Paula. All rights reserved.
//

import Alamofire
import Foundation
import SDK

enum HeroesRouter: RouterProtocol {
    case list
    
    var needsAuth: Bool {
        return true
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        return "characters"
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .list:
            return nil
        }
    }
    
    var headers: [String: String]? {
        let defaultHeaders: [String: String] = [:]
        return defaultHeaders
    }
    
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
}
