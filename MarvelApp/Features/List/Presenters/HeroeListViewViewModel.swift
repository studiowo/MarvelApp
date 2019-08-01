//
//  HeroeListViewViewModel.swift
//  MarvelApp
//
//  Created by Renato Matos de Paula on 30/07/19.
//  Copyright © 2019 Renato Matos de Paula. All rights reserved.
//

import UIKit

typealias HeroeListData = (name: String, image: String)

final class HeroeListViewViewModel: CollectionViewViewModel<HeroeCollectionViewCell, HeroeListData> {
    override func config(cell: HeroeCollectionViewCell, data: HeroeListData, indexPath: IndexPath) {
        cell.setupViews()
        cell.accessibilityIdentifier = "HEROE_CELL_\(indexPath.row)"
        
        cell.labelHeroe.text = data.name
        cell.imageHeroe.downloadImage(from: data.image)
    }
}
