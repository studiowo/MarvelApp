//
//  AppDelegate.swift
//  MarvelApp
//
//  Created by Renato Matos de Paula on 25/07/19.
//  Copyright © 2019 Renato Matos de Paula. All rights reserved.
//

import UIKit
import SDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, AuthProtocol {
    
    var window: UIWindow?
    var rootCoordinator: AppCoordinator?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        
        
        let environment = HMACEnvironment(baseURL: Environment.baseUrl,
                                          apiKey: Environment.publicKey,
                                          hash: "\(Environment.privateKey)\(Environment.publicKey)", sslCertificates: [])
        
        SDKEnvironment(authType: .hmac(urlEnvironment: environment),
                       accessCode: "1234567890",
                       window: window, authProtocol: self).setup()
        
        rootCoordinator = AppCoordinator(window: window)
        rootCoordinator?.start()
        
        return true
    }
}

extension AuthProtocol where Self: AppDelegate {
    func needsAuthenticate(success: () -> Void) {}
}
