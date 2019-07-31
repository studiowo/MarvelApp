//
//  WindowHelper.swift
//  MarvelAppUITests
//
//  Created by Renato Matos de Paula on 30/07/19.
//  Copyright © 2019 Renato Matos de Paula. All rights reserved.
//

import UIKit

class WindowHelper {
    
    static var testWindow: UIWindow = {
        let window = UIWindow(frame: UIScreen.main.bounds)
        return window
    }()
    
    static func showInTestWindow(viewController: UIViewController) {
        WindowHelper.testWindow.rootViewController = viewController
        WindowHelper.testWindow.makeKeyAndVisible()
    }
}
