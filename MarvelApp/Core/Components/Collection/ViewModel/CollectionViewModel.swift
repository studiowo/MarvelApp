//
//  CollectionViewModel.swift
//  MarvelApp
//
//  Created by Renato Matos de Paula on 02/08/19.
//  Copyright © 2019 Renato Matos de Paula. All rights reserved.
//

import UIKit

class CollectionViewModel: CollectionViewViewModel<CollectionCell, CollectionViewSource> {

    override func config(cell: CollectionCell, data: CollectionViewSource, indexPath: IndexPath) {
        cell.source = data
    }
    
    override func size(cell: CollectionViewCell?, data: Any, indexPath: IndexPath, view: UIView, height: CGFloat?, isHorizontal: Bool) -> CGSize {
        let grid = Grid(columns: 1)
        return grid.size(for: view, height: height ?? 180.0, items: grid.columns)
    }
}
