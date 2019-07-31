//
//  CollectionViewSource.swift
//  MarvelApp
//
//  Created by Renato Matos de Paula on 29/07/19.
//  Copyright © 2019 Renato Matos de Paula. All rights reserved.
//

import UIKit

class CollectionViewSource: NSObject, CollectionViewSourceProtocol {
    
    weak var context: CollectionViewContext?
    var sections: [CollectionViewSection]
    var callback: CollectionViewCallback?
    var spacements: LayoutSpacements {
        return LayoutSpacements()
    }
    
    init(sections: [CollectionViewSection] = [],
         callback: CollectionViewCallback? = nil) {
        
        self.sections = sections
        self.callback = callback
        
        super.init()
    }
    
    func updateSections(_ sections: [CollectionViewSection]) {
        self.sections = sections
    }
    
    // MARK: Helpers
    func itemAt(_ section: Int) -> CollectionViewSection? {
        return sections.element(at: section)
    }
    
    func itemAt(_ indexPath: IndexPath) -> CollectionViewViewModelProtocol? {
        return itemAt(indexPath.section)?.items.element(at: indexPath.item)
    }
    
    // MARK: Register views
    func register(itemsFor collectionView: UICollectionView) {
        
        for section in sections {
            for cell in section.items.map({ $0.cell }) {
                cell.register(itemFor: collectionView)
            }
        }
    }
}

//MARK: CollectionView Delegate
extension CollectionViewSource: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        guard let data = itemAt(indexPath), let context = context else {
            return
        }
        
        itemAt(indexPath.section)?.callback?(data.value, indexPath)
        context.didSelectItemAt(index: indexPath)
    }
}
