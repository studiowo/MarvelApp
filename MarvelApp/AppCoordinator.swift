//
//  AppCoordinator.swift
//  MarvelApp
//
//  Created by Renato Matos de Paula on 31/07/19.
//  Copyright © 2019 Renato Matos de Paula. All rights reserved.
//

import os.log
import UIKit

enum MainEvent: AppEvent {
    case detail(viewModel: MarvelListViewModel, position: Int)
    
    var type: AppEventType {
        return .flow
    }
}

final class AppCoordinator: Coordinator, ViewModelAccess {
    private var window: UIWindow
    private var navigationController: UINavigationController
    
    init(window: UIWindow) {
        self.window = window
        self.navigationController = UINavigationController()
        
        super.init(rootViewController: nil)
    }
    
    override func start(with completion: @escaping () -> Void = {}) {
        let mainViewController = HeroeViewControllerFactory.getMainViewController()
        mainViewController.parentCoordinator = self
        
        self.window.rootViewController = self.navigationController
        self.navigationController.pushViewController(mainViewController, animated: false)
        self.window.makeKeyAndVisible()
        
        self.registerEvents()
        
        super.start(with: completion)
    }
    
    private func registerEvents() {
        self.register(eventType: MainEvent.self) { [weak self] event in
            guard let self = self else { return }
            
            switch event {
            case .detail(let viewModel, let position):
                guard let model = viewModel.getModel(self),
                    let heroe = model.results?[position] else { return }
                
                let detailViewController = HeroeViewControllerFactory.getDetailViewController(with: heroe)
                self.navigationController.pushViewController(detailViewController, animated: true)
                break
            }
        }
    }
}
