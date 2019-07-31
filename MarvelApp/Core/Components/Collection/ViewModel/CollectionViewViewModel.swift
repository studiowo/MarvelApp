//
//  CollectionViewViewModel.swift
//  MarvelApp
//
//  Created by Renato Matos de Paula on 29/07/19.
//  Copyright © 2019 Renato Matos de Paula. All rights reserved.
//

import UIKit

class CollectionViewViewModel<Cell, Data>: CollectionViewViewModelProtocol where Cell: CollectionViewCell, Data: Any {
    
    private var offscreenCells: [String: UICollectionViewCell] = [:]
    weak var context: CollectionViewContext?
    var data: Data
    var cell: CollectionViewCell.Type { return Cell.self }
    var value: Any { return self.data }
    
    init(_ data: Data) {
        self.data = data
        self.initialize()
    }
    
    // MARK: - CollectionViewViewModelProtocol
    
    func setContext(context: CollectionViewContext?) {
        self.context = context
    }
    
    func config(cell: CollectionViewCell, data: Any, indexPath: IndexPath) {
        guard let data = data as? Data, let cell = cell as? Cell else {
            return
        }
        return self.config(cell: cell, data: data, indexPath: indexPath)
    }
    
    func size(cell: CollectionViewCell?, data: Any, indexPath: IndexPath, view: UIView, height: CGFloat? = nil, isHorizontal: Bool = false) -> CGSize {
        guard let dataItem = data as? CollectionViewViewModel, let item = cell, let reuseIdentifier = item.reuseIdentifier else {
            return .zero
        }
        
        if self.offscreenCells[reuseIdentifier] == nil {
            self.offscreenCells[reuseIdentifier] = item
        }
        
        dataItem.config(cell: item, data: dataItem.value, indexPath: indexPath)
        
        let width = isHorizontal ? item.bounds.width : UIScreen.main.bounds.width
        
        item.bounds = CGRect(x: 0, y: 0, width: width, height: item.bounds.height)
        item.contentView.bounds = item.bounds
        
        item.setNeedsLayout()
        item.layoutIfNeeded()
        
        var size = item.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        if !isHorizontal {
            size.width = UIScreen.main.bounds.width
        }
        
        return size
    }
    
    func callback(data: Any, indexPath: IndexPath) {
        guard let data = data as? Data else {
            return
        }
        return self.callback(data: data, indexPath: indexPath)
    }
    
    // MARK: - API
    
    func initialize() {}
    func config(cell: Cell, data: Data, indexPath: IndexPath) {}
    func size(data: Data, indexPath: IndexPath, view: UIView) -> CGSize {
        return .zero
    }
    func callback(data: Data, indexPath: IndexPath) {}
    func callback(data: Any, indexPath: IndexPath, selected: Bool) {}
}
