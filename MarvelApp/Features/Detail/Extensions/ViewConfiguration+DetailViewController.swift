//
//  ViewConfiguration+DetailViewController.swift
//  MarvelApp
//
//  Created by Renato Matos de Paula on 01/08/19.
//  Copyright © 2019 Renato Matos de Paula. All rights reserved.
//

import Foundation

extension ViewConfiguration where Self: DetailViewController {
    func configureViews() {
        view.backgroundColor = .black
        view.accessibilityIdentifier = "DETAIL_SCREEN_VIEW"
        
        source = CollectionViewSource(sections: [], callback: nil)
        viewModel.updateSections = { [weak self] sections in
            guard let self = self else { return }
            self.source?.updateSections(sections)
            self.collectionView.reloadData()
        }
    }
    
    func setupViewHierarchy() {
        self.view.addSubview(collectionView)
    }
    
    func setupConstraints() {
        collectionView.constraintToSuperview()
    }
}
