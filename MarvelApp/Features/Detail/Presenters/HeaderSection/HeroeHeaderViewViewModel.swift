//
//  HeroeHeaderViewViewModel.swift
//  MarvelApp
//
//  Created by Renato Matos de Paula on 01/08/19.
//  Copyright © 2019 Renato Matos de Paula. All rights reserved.
//

import UIKit

final class HeroeHeaderViewViewModel: CollectionViewViewModel<HeroeHeaderSectionCell, String> {
    override func config(cell: HeroeHeaderSectionCell, data: String, indexPath: IndexPath) {
        cell.setupViews()
        cell.accessibilityIdentifier = "HEROE_HEADER_\(indexPath.row)"
        
        cell.labelTitle.text = data
    }
    
    override func size(cell: CollectionViewCell?, data: Any, indexPath: IndexPath, view: UIView, height: CGFloat?, isHorizontal: Bool) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 32, height: 40)
    }
}
