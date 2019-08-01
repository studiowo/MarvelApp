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
        
        viewModel.updateSections = { [weak self] sections, offset, limit, total in
            guard let self = self else { return }
            
            self.hideLoading()
            self.source?.updateSections(sections)
            self.source?.register(itemsFor: self.collectionView)
            
            if offset == 0 {
                self.collectionView.reloadData()
            } else {
                var indexPaths: [IndexPath] = []
                for index in offset...offset + limit-1 where index < total {
                    let indexPath: IndexPath = IndexPath(item: index, section: 0)
                    indexPaths.append(indexPath)
                }
                
                DispatchQueue.main.async { [unowned self] in
                    self.collectionView.performBatchUpdates({
                        self.collectionView.insertItems(at: indexPaths)
                    })
                }
            }
        }
        
        self.view.backgroundColor = .white
    }
    
    func setupViewHierarchy() {
        self.view.addSubview(collectionView)
    }
    
    func setupConstraints() {
        collectionView.constraintToSuperview()
    }
}
