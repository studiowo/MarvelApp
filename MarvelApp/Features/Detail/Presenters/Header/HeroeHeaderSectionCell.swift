//
//  HeroeHeaderSectionCell.swift
//  MarvelApp
//
//  Created by Renato Matos de Paula on 01/08/19.
//  Copyright © 2019 Renato Matos de Paula. All rights reserved.
//

import UIKit

final class HeroeHeaderSectionCell: CollectionViewCell {
    lazy var labelTitle: UILabel = {
        let label = UILabel()
        label.prepare()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    override func setupViewHierarchy() {
        contentView.addSubview(labelTitle)
    }
    
    override func setupConstraints() {
        labelTitle.constraintToSuperview()
    }
}

