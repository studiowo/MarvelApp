//
//  HeroeDetailHeaderCell.swift
//  MarvelApp
//
//  Created by Renato Matos de Paula on 01/08/19.
//  Copyright © 2019 Renato Matos de Paula. All rights reserved.
//

import UIKit

final class HeroeDetailHeaderCell: CollectionViewCell {
    
    lazy var imageCover: UIImageView = {
        let imageView = UIImageView()
        imageView.prepare()
        imageView.addBlur(visualEffectView: VisualEffect.effect(style: .custom(.light, intensity: 0.3)))
        imageView.image = UIImage(named: "placeholder")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var imageHeroe: UIImageView = {
        let imageView = UIImageView()
        imageView.prepare()
        imageView.image = UIImage(named: "placeholder")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var labelHeroe: UILabel = {
        let label = UILabel()
        label.prepare()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imageHeroe.image = nil
    }
    
    override func setupViewHierarchy() {
        super.setupViewHierarchy()
        [imageCover, imageHeroe, labelHeroe].forEach(contentView.addSubview)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        imageHeroe
            .widthAnchor(equalTo: 150)
            .heightAnchor(equalTo: 150)
            .centerXAnchor(equalTo: contentView.centerXAnchor)
            .centerYAnchor(equalTo: contentView.centerYAnchor, constant: -48)
        
        labelHeroe
            .topAnchor(equalTo: imageHeroe.bottomAnchor, constant: 24, priority: .defaultLow)
            .widthAnchor(equalTo: UIScreen.main.bounds.size.width - 32)
            .centerXAnchor(equalTo: contentView.centerXAnchor)
        
        imageCover
            .topAnchor(equalTo: contentView.topAnchor)
            .bottomAnchor(equalTo: contentView.bottomAnchor, constant: -32, priority: .defaultLow)
            .widthAnchor(equalTo: UIScreen.main.bounds.size.width)
            .heightAnchor(equalTo: UIScreen.main.bounds.size.width)
            .centerXAnchor(equalTo: contentView.centerXAnchor)
    }
}
