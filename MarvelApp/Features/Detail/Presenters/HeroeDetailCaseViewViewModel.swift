//
//  HeroeDetailCaseViewViewModel.swift
//  MarvelApp
//
//  Created by Renato Matos de Paula on 01/08/19.
//  Copyright © 2019 Renato Matos de Paula. All rights reserved.
//

import UIKit

typealias HeroeDetailCaseData = (name: String, image: String)

final class HeroeDetailCaseViewViewModel: CollectionViewViewModel<HeroeDetailCaseCell, HeroeDetailCaseData> {
    override func config(cell: HeroeDetailCaseCell, data: HeroeDetailCaseData, indexPath: IndexPath) {
        cell.setupViews()
        cell.accessibilityIdentifier = "HEROE_DETAIL_CASE_CELL_\(indexPath.row)"
        
        cell.labelCase.text = data.name
        cell.imageCase.downloadImage(from: data.image)
    }
    
    override func size(cell: CollectionViewCell?, data: Any, indexPath: IndexPath, view: UIView, height: CGFloat?, isHorizontal: Bool) -> CGSize {
        return CGSize(width: 166, height: height ?? 180)
    }
}
