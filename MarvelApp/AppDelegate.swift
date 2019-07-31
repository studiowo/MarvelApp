//
//  AppDelegate.swift
//  MarvelApp
//
//  Created by Renato Matos de Paula on 25/07/19.
//  Copyright © 2019 Renato Matos de Paula. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var rootCoordinator: AppCoordinator?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        
        rootCoordinator = AppCoordinator(window: window)
        rootCoordinator?.start()
        
        return true
    }
}
