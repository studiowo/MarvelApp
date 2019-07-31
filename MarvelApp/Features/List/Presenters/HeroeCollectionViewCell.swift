//
//  HeroeCollectionViewCell.swift
//  MarvelApp
//
//  Created by Renato Matos de Paula on 30/07/19.
//  Copyright © 2019 Renato Matos de Paula. All rights reserved.
//

import UIKit

final class HeroeCollectionViewCell: CollectionViewCell {
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .white)
        indicator.prepare()
        indicator.startAnimating()
        return indicator
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
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    lazy var viewBackgroundTitle: UIView = {
        let view = UIView()
        view.prepare()
        view.backgroundColor = .black
        view.alpha = 0.9
        return view
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imageHeroe.image = nil
        activityIndicator.startAnimating()
    }
 
    override func setupViewHierarchy() {
        super.setupViewHierarchy()
        [activityIndicator, imageHeroe, viewBackgroundTitle].forEach(contentView.addSubview)
        viewBackgroundTitle.addSubview(labelHeroe)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        activityIndicator
            .centerXAnchor(equalTo: contentView.centerXAnchor)
            .centerYAnchor(equalTo: contentView.centerYAnchor, constant: -32)
        
        let bottom = imageHeroe.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        bottom.priority = .defaultLow
        bottom.isActive = true
        
        imageHeroe
            .topAnchor(equalTo: contentView.topAnchor)
            .widthAnchor(equalTo: UIScreen.main.bounds.size.width)
            .heightAnchor(equalTo: UIScreen.main.bounds.size.width)
            .centerXAnchor(equalTo: contentView.centerXAnchor)
        
        viewBackgroundTitle
            .bottomAnchor(equalTo: contentView.bottomAnchor)
            .leadingAnchor(equalTo: contentView.leadingAnchor)
            .trailingAnchor(equalTo: contentView.trailingAnchor)

        labelHeroe
            .topAnchor(equalTo: viewBackgroundTitle.topAnchor, constant: 16, priority: .defaultLow)
            .bottomAnchor(equalTo: viewBackgroundTitle.bottomAnchor, constant: -16)
            .leadingAnchor(equalTo: viewBackgroundTitle.leadingAnchor, constant: 16)
    }
}
