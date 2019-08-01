//
//  SDKEnvironment.swift
//  SDK
//
//  Created by Renato Matos on 24/09/18.
//  Copyright © 2018 Renato Matos. All rights reserved.
//

import UIKit

public enum AuthorizationType {
    case grant(urlEnvironment: GrantEnvironment)
    case hmac(urlEnvironment: HMACEnvironment)
}

public struct GrantEnvironment {
    let baseURL: String
    let version: String
    let clientSecret: String
    let clientID: String
    let sslCertificates: [SSLCertificate]
    
    public init(baseURL: String, version: String, clientSecret: String, clientID: String, sslCertificates: [SSLCertificate]) {
        self.baseURL = baseURL
        self.version = version
        self.clientSecret = clientSecret
        self.clientID = clientID
        self.sslCertificates = sslCertificates
    }
}

public struct HMACEnvironment {
    let baseURL: String
    let apiKey: String
    let hash: String
    let sslCertificates: [SSLCertificate]
    
    public init(baseURL: String, apiKey: String, hash: String, sslCertificates: [SSLCertificate]) {
        self.baseURL = baseURL
        self.apiKey = apiKey
        self.hash = hash
        self.sslCertificates = sslCertificates
    }
}

public struct SDKEnvironment {
    let authType: AuthorizationType
    let accessCode: String
    let window: UIWindow
    let authProtocol: AuthProtocol

    public init(authType: AuthorizationType, accessCode: String, window: UIWindow, authProtocol: AuthProtocol) {
        self.authType = authType
        self.accessCode = accessCode
        self.window = window
        self.authProtocol = authProtocol
    }

    public func setup() {
        SDKClient.shared.setup(with: self)
    }
}
