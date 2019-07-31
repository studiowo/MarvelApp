//
//  UIViewController+Coordinator.swift
//  MarvelApp
//
//  Created by Renato Matos de Paula on 31/07/19.
//  Copyright © 2019 Renato Matos de Paula. All rights reserved.
//

import UIKit

extension UIViewController {
    var parentCoordinator: Coordinator? {
        get { return self-->"parentCoordinator" }
        set { self-->["parentCoordinator": newValue] }
    }
    
    func handleEvents<T: AppEvent>(event: T) {
        do {
            try self.parentCoordinator?.handle(event: event)
        } catch {
            if case let AppEventError.eventNotHandled(event) = error {
                fatalError("event not handled: [\(String(reflecting: type(of: event)))]")
            }
        }
    }
}
