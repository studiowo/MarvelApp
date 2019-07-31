//
//  CollectionViewDataSource.swift
//  MarvelApp
//
//  Created by Renato Matos de Paula on 29/07/19.
//  Copyright © 2019 Renato Matos de Paula. All rights reserved.
//

import UIKit

extension CollectionViewSource: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemAt(section)?.items.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return self.collectionView(collectionView, itemForIndexPath: indexPath)
    }
    
    private func collectionView(_ collectionView: UICollectionView,
                                itemForIndexPath indexPath: IndexPath) -> UICollectionViewCell {
        guard let data = itemAt(indexPath), let item = data.cell.reuse(collectionView, indexPath: indexPath) as? CollectionViewCell else {
            return CollectionViewCell()
        }
        
        item.layer.shouldRasterize = true
        item.layer.rasterizationScale = UIScreen.main.scale
        
        data.setContext(context: context)
        data.config(cell: item, data: data.value, indexPath: indexPath)
        
        return item
    }
}
