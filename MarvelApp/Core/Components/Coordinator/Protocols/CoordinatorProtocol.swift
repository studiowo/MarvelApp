//
//  CoordinatorProtocol.swift
//  MarvelApp
//
//  Created by Renato Matos de Paula on 31/07/19.
//  Copyright © 2019 Renato Matos de Paula. All rights reserved.
//

import Foundation

protocol CoordinatorProtocol: AnyObject, NSObjectProtocol {
    var parent: CoordinatorProtocol? { get set }
    
    var identifier: String { get }
    
    var handlers: [String: (AppEvent) -> Void] { get }
    
    func target<T: AppEvent>(forEvent event: T) -> CoordinatorProtocol?
    func handle<T: AppEvent>(event: T) throws
    func register<T: AppEvent>(eventType: T.Type, handler: @escaping (T) -> Void)
    func canHandle<T: AppEvent>(event: T) -> Bool
    
    func start(with completion: @escaping () -> Void)
    func stop(with completion: @escaping () -> Void)
    
    var childCoordinators: [String: CoordinatorProtocol] { get }
    
    func start(child coordinator: CoordinatorProtocol, completion: @escaping () -> Void)
    func stop(child coordinator: CoordinatorProtocol, completion: @escaping () -> Void)
}

extension CoordinatorProtocol {
    var identifier: String {
        return "\(String(describing: type(of: self)))-\(self.hash)"
    }
}
