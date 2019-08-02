//
//  CollectionCell.swift
//  MarvelApp
//
//  Created by Renato Matos de Paula on 02/08/19.
//  Copyright © 2019 Renato Matos de Paula. All rights reserved.
//

import UIKit

class CollectionCell: CollectionViewCell {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .clear
        collection.isPrefetchingEnabled = false
        collection.clipsToBounds = true
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()
    
    var source: CollectionViewSource? = nil {
        didSet {
            self.source?.register(itemsFor: self.collectionView)
            
            self.collectionView.dataSource = self.source
            self.collectionView.delegate = self.source
            
            self.contentView.addSubview(self.collectionView)
            
            self.collectionView
                .topAnchor(equalTo: self.contentView.topAnchor)
                .bottomAnchor(equalTo: self.contentView.bottomAnchor)
                .leadingAnchor(equalTo: self.contentView.leadingAnchor)
                .trailingAnchor(equalTo: self.contentView.trailingAnchor)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func reset() {
        super.reset()
        self.source = nil
    }
    
    func reloadAllCollection() {
        self.collectionView.reloadData()
    }
}
