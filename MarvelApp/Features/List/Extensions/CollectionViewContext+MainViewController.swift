//
//  CollectionViewContext+MainViewController.swift
//  MarvelApp
//
//  Created by Renato Matos de Paula on 31/07/19.
//  Copyright © 2019 Renato Matos de Paula. All rights reserved.
//

import Foundation

extension CollectionViewContext where Self: MainViewController {
    func didSelectItemAt(index: IndexPath) {
        self.handleEvents(event: MainEvent.detail(viewModel: self.viewModel, position: index.row))
    }
}
