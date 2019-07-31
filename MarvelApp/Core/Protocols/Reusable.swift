//
//  Reusable.swift
//  MarvelApp
//
//  Created by Renato Matos de Paula on 29/07/19.
//  Copyright © 2019 Renato Matos de Paula. All rights reserved.
//

import UIKit

extension UICollectionViewCell {
    
    public static var uniqueIdentifier: String {
        return String(describing: self)
    }
    
    // MARK: Cells
    public static func register(classFor collectionView: UICollectionView) {
        collectionView.register(self, forCellWithReuseIdentifier: self.uniqueIdentifier)
    }
    
    public static func register(itemFor collectionView: UICollectionView) {
        self.register(classFor: collectionView)
    }
    
    public static func reuse(_ collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: self.uniqueIdentifier, for: indexPath)
    }
}
