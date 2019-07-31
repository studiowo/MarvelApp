//
//  HeroeCoordinator.swift
//  MarvelApp
//
//  Created by Renato Matos de Paula on 31/07/19.
//  Copyright © 2019 Renato Matos de Paula. All rights reserved.
//

import Foundation

struct HeroeViewControllerFactory {
    static func getMainViewController() -> MainViewController {
        return MainViewController(viewModel: MarvelListViewModel())
    }
    
    static func getDetailViewController(with model: Heroe) -> DetailViewController {
        return DetailViewController(with: HeroeDetailViewModel(with: model))
    }
}
