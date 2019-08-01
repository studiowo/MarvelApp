//
//  Api.swift
//  SDK
//
//  Created by Renato Matos on 02/08/18.
//  Copyright © 2018 Renato Matos. All rights reserved.
//

import Foundation
import Alamofire

class Api {

    static let shared = Api()
    private let client = ApiClient.shared

    private var didFinishConfig: (() -> Void)? = nil
    private var didFinishError: (() -> Void)? = nil

    func setupClient(with baseUrl: String, didFinishConfig: (() -> Void)? = nil, didFinishError: (() -> Void)? = nil) {
        guard let environment = SDKClient.shared.environment else {
            fatalError("Environment SDK should not be nil 😑")
        }

        self.didFinishConfig = didFinishConfig
        self.didFinishError = didFinishError
        
        switch environment.authType {
        case .grant(let environment):
            self.setupGrantConfiguration(environment)
            break
        case .hmac(let environment):
            self.setupHMACConfiguration(environment)
            break
        }
    }
    
    private func setupGrantConfiguration(_ environment: GrantEnvironment) {
        let base = environment.baseURL
        let version = environment.version
        let baseUrl = "\(base)\(version)/"
        
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        configuration.httpCookieAcceptPolicy = .always
        configuration.timeoutIntervalForRequest = 20
        configuration.timeoutIntervalForResource = 20
        configuration.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        configuration.urlCache = nil
        configuration.tlsMinimumSupportedProtocol = .tlsProtocol12
        
        let serverTurstPolicies: [String: ServerTrustPolicy] = [
            baseUrl: .pinCertificates(
                certificates: environment.sslCertificates.compactMap { $0.certificate() },
                validateCertificateChain: true,
                validateHost: true
            )
        ]
        
        let serverTrustPolicyManager = ServerTrustPolicyManager(policies: serverTurstPolicies)
        
        self.client.setupClient(configuration: configuration, baseURL: baseUrl, timeout: 60, errorHandler: self, apiConfig: serverTrustPolicyManager)
        self.didFinishConfig?()
    }
    
    private func setupHMACConfiguration(_ environment: HMACEnvironment) {
        let base = environment.baseURL
        let baseUrl = "\(base)"
        
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        configuration.httpCookieAcceptPolicy = .always
        configuration.timeoutIntervalForRequest = 20
        configuration.timeoutIntervalForResource = 20
        configuration.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        configuration.urlCache = nil
        configuration.tlsMinimumSupportedProtocol = .tlsProtocol12
        
        let serverTurstPolicies: [String: ServerTrustPolicy] = [
            baseUrl: .pinCertificates(
                certificates: environment.sslCertificates.compactMap { $0.certificate() },
                validateCertificateChain: true,
                validateHost: true
            )
        ]
        
        let serverTrustPolicyManager = ServerTrustPolicyManager(policies: serverTurstPolicies)
        
        self.client.setupClient(configuration: configuration, baseURL: baseUrl, timeout: 60, errorHandler: self, apiConfig: serverTrustPolicyManager)
        self.didFinishConfig?()
    }
}


extension Api: RequestErrorHandlerProtocol {
    func handleErrorResult(_ errorResult: ErrorResult) {

    }
}
