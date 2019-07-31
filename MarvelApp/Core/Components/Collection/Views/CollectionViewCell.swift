//
//  CollectionViewCell.swift
//  MarvelApp
//
//  Created by Renato Matos de Paula on 29/07/19.
//  Copyright © 2019 Renato Matos de Paula. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell, ViewConfiguration {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initialize()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.reset()
    }
    
    func initialize() {}
    func reset() {
        for view in self.subviews {
            for constraint in view.constraints {
                view.removeConstraint(constraint)
            }
        }
    }
    
    func configureViews() {
        contentView.clipsToBounds = true
    }
    func setupViewHierarchy() { }
    func setupConstraints() { }
}
