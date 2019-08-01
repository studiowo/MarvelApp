//
//  HeroeDetailViewViewModel.swift
//  MarvelApp
//
//  Created by Renato Matos de Paula on 01/08/19.
//  Copyright © 2019 Renato Matos de Paula. All rights reserved.
//

import UIKit

typealias HeroeDetailHeaderData = (name: String, image: String)

final class HeroeDetailViewViewModel: CollectionViewViewModel<HeroeDetailHeaderCell, HeroeDetailHeaderData> {
    override func config(cell: HeroeDetailHeaderCell, data: HeroeDetailHeaderData, indexPath: IndexPath) {
        cell.setupViews()
        cell.accessibilityIdentifier = "HEROE_DETAIL_HEADER_CELL_\(indexPath.row)"
        
        cell.labelHeroe.text = data.name
        cell.imageHeroe.downloadImage(from: data.image)
    }
}
