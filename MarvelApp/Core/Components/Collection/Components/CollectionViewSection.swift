//
//  CollectionViewSection.swift
//  MarvelApp
//
//  Created by Renato Matos de Paula on 29/07/19.
//  Copyright © 2019 Renato Matos de Paula. All rights reserved.
//

import Foundation

typealias CollectionViewCallback = (Any, IndexPath) -> Void
typealias CollectionViewEmptyCallback = () -> Void

class CollectionViewSection {
    var items: [CollectionViewViewModelProtocol]
    var callback: CollectionViewCallback?
    
    init(items: [CollectionViewViewModelProtocol] = [], callback: CollectionViewCallback? = nil) {
        self.items = items
        self.callback = callback
    }
}
