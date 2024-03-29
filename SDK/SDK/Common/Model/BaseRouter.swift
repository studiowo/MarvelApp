//
//  BaseRouter.swift
//  SDK
//
//  Created by Renato Matos on 02/10/18.
//  Copyright © 2018 Renato Matos. All rights reserved.
//

import Foundation
import Alamofire

public protocol RouterProtocol {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: [String: Any]? { get }
    var headers: [String: String]? { get }
    var parameterEncoding: ParameterEncoding { get }
    var needsAuth: Bool { get }
}

public protocol AuthRouterProtocol: RouterProtocol {
    var token: String { get }
    func token(token: String)
}
extension AuthRouterProtocol {
    func token(token: String) {

    }
}

enum Router: URLRequestConvertible {
    case request(data: RouterProtocol)

    fileprivate var method: HTTPMethod {
        switch self {
        case .request(let data):
            return data.method
        }
    }

    fileprivate var path: String {
        switch self {
        case .request(let data):
            return data.path
        }
    }

    fileprivate var parameters: [String: Any]? {
        switch self {
        case .request(let data):
            var params: [String: Any] = data.parameters ?? [:]
            if let env = SDKClient.shared.environment {
                switch env.authType {
                case .hmac(let environment):
                    let ts = "\(Date().currentTimeMillis())"
                    params["ts"] = ts
                    params["apikey"] = environment.apiKey
                    params["hash"] = ApiFactory.getHash(ts: ts, hash: environment.hash)
                    break
                default:
                    break
                }
            }
            
            return params
        }
    }

    fileprivate var headers: [String: String]? {
        var defaultHeaders: [String: String] = [:]

        switch self {
        case .request(let data):
            defaultHeaders = data.headers ?? [:]
            defaultHeaders["Accept-Encoding"] = "application/gzip"
            return defaultHeaders
        }
    }

    fileprivate var baseUrl: String {
        return SDKClient.shared.baseUrl
    }

    var parameterEncoding: ParameterEncoding {
        switch self {
        case .request(let data):
            return data.parameterEncoding
        }
    }

    func asURLRequest() -> URLRequest {

        do {
            let url = try self.baseUrl.asURL()

            var urlRequest = URLRequest(url: url.appendingPathComponent(self.path))
            urlRequest.httpMethod = self.method.rawValue
            urlRequest.allHTTPHeaderFields = headers

            return try parameterEncoding.encode(urlRequest, with: self.parameters ?? [:])
        } catch {
            return URLRequest(url: URL(string: "")!)
        }
    }
}
