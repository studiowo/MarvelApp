//
//  Coordinator.swift
//  MarvelApp
//
//  Created by Renato Matos de Paula on 31/07/19.
//  Copyright © 2019 Renato Matos de Paula. All rights reserved.
//

import UIKit

enum AppEventError: Swift.Error {
    case eventNotHandled(AppEvent)
}

class Coordinator: NSObject, CoordinatorProtocol {
    
    private struct AssociatedKeys {
        static var RootViewController = "RootViewController"
        static var ChildCoordinators = "ChildCoordinators"
        static var ParentCoordinator = "ParentCoordinator"
    }
    
    private(set) public var handlers: [String: (AppEvent) -> Void] = [:]
    
    weak var rootViewController: UIViewController?
    weak var parent: CoordinatorProtocol?
    
    var childCoordinators: [String: CoordinatorProtocol] = [:]
    
    init(rootViewController: UIViewController?) {
        self.rootViewController = rootViewController
    }
    
    // MARK: Start/Stop
    func start(with completion: @escaping () -> Void = {}) {
        self.rootViewController?.parentCoordinator = self
        completion()
    }
    
    func stop(with completion: @escaping () -> Void = {}) {
        self.rootViewController?.parentCoordinator = nil
    }
    
    func start(child coordinator: CoordinatorProtocol, completion: @escaping () -> Void = {}) {
        self.childCoordinators[coordinator.identifier] = coordinator
        coordinator.parent = self
        coordinator.start(with: completion)
    }
    
    func stop(child coordinator: CoordinatorProtocol, completion: @escaping () -> Void = {}) {
        coordinator.parent = nil
        coordinator.stop { [unowned self] in
            self.childCoordinators.removeValue(forKey: coordinator.identifier)
            completion()
        }
    }
    
    // MARK: Handlers
    final func register<T>(eventType: T.Type, handler: @escaping (T) -> Void) where T: AppEvent {
        handlers[String(reflecting: eventType)] = { ev in
            guard let realEV = ev as? T else { return }
            handler(realEV)
        }
    }
    
    final func handle<T: AppEvent>(event: T) throws {
        let target = self.target(forEvent: event)
        guard let handler = target?.handlers[String(reflecting: type(of: event))] else {
            throw AppEventError.eventNotHandled(event)
        }
        handler(event)
    }
    
    final func canHandle<T: AppEvent>(event: T) -> Bool {
        return handlers[String(reflecting: type(of: event))] != nil
    }
    
    func target<T: AppEvent>(forEvent event: T) -> CoordinatorProtocol? {
        guard self.canHandle(event: event) != true else { return self }
        var next = self.parent
        while next?.canHandle(event: event) == false {
            next = next?.parent
        }
        return next
    }
}
