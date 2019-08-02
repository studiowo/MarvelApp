//
//  HeroeDetailCaseCell.swift
//  MarvelApp
//
//  Created by Renato Matos de Paula on 01/08/19.
//  Copyright © 2019 Renato Matos de Paula. All rights reserved.
//

import UIKit

final class HeroeDetailCaseCell: CollectionViewCell {
    
    lazy var imageCase: UIImageView = {
        let imageView = UIImageView()
        imageView.prepare()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 50
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var labelCase: UILabel = {
        let label = UILabel()
        label.prepare()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textAlignment = .center
        label.textColor = .lightGray
        return label
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imageCase.image = nil
    }
    
    override func setupViewHierarchy() {
        super.setupViewHierarchy()
        [imageCase, labelCase].forEach(contentView.addSubview)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        imageCase
            .widthAnchor(equalTo: 100)
            .heightAnchor(equalTo: 100)
            .topAnchor(equalTo: contentView.topAnchor)
            .centerXAnchor(equalTo: contentView.centerXAnchor)
        
        labelCase
            .topAnchor(equalTo: imageCase.bottomAnchor, constant: 8, priority: .defaultLow)
            .widthAnchor(equalTo: 120)
            .centerXAnchor(equalTo: contentView.centerXAnchor)
    }
}
