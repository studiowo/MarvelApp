//
//  ViewConfiguration+MainViewController.swift
//  MarvelApp
//
//  Created by Renato Matos de Paula on 31/07/19.
//  Copyright © 2019 Renato Matos de Paula. All rights reserved.
//

import Foundation

extension ViewConfiguration where Self: MainViewController {
    func configureViews() {
        source = CollectionViewSource(sections: [], callback: nil)
        source?.context = self
        
        viewModel.updateSections = { sections in
            self.source?.updateSections(sections)
            self.source?.register(itemsFor: self.collectionView)
            self.collectionView.reloadData()
        }
        
        hideLoading()
        
        self.view.backgroundColor = .white
    }
    
    func setupViewHierarchy() {
        self.view.addSubview(collectionView)
    }
    
    func setupConstraints() {
        collectionView.constraintToSuperview()
    }
}
