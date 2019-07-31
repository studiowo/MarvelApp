//
//  HeroeListViewModel.swift
//  MarvelApp
//
//  Created by Renato Matos de Paula on 30/07/19.
//  Copyright © 2019 Renato Matos de Paula. All rights reserved.
//

import UIKit

final class HeroeListViewModel: CollectionViewViewModel<HeroeCollectionViewCell, Heroe> {
    override func config(cell: HeroeCollectionViewCell, data: Heroe, indexPath: IndexPath) {
        cell.setupViews()
        cell.accessibilityIdentifier = "HEROE_CELL_\(indexPath.row)"
        
        guard let name = data.name, let thumbnail = data.thumbnail, let path = thumbnail.path, let ext = thumbnail.extension else {
            return
        }
        
        cell.labelHeroe.text = name
        cell.imageHeroe.downloadImage(from: "\(path).\(ext)")
    }
}
