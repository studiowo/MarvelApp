//
//  CollectionViewViewModelProtocol.swift
//  MarvelApp
//
//  Created by Renato Matos de Paula on 29/07/19.
//  Copyright © 2019 Renato Matos de Paula. All rights reserved.
//

import UIKit

protocol CollectionViewContext: AnyObject {
    func reloadCollection(at indexPath: [IndexPath], animated: Bool)
    func reloadSection(at indexSet: IndexSet, completion: (() -> Void)?)
    func reloadAllCollection()
    func didSelectItemAt(index: IndexPath)
}

extension CollectionViewContext {
    func reloadCollection(at indexPath: [IndexPath], animated: Bool) {}
    func reloadSection(at indexSet: IndexSet, completion: (() -> Void)?) {}
    func reloadAllCollection() {}
}

protocol CollectionViewSourceProtocol: AnyObject {
    var spacements: LayoutSpacements { get }
    func updateSections(_ sections: [CollectionViewSection])
}

protocol CollectionViewViewModelProtocol {
    var cell: CollectionViewCell.Type { get }
    var value: Any { get }
    
    func setContext(context: CollectionViewContext?)
    func config(cell: CollectionViewCell, data: Any, indexPath: IndexPath)
    func size(cell: CollectionViewCell?, data: Any, indexPath: IndexPath, view: UIView, height: CGFloat?, isHorizontal: Bool) -> CGSize
    func callback(data: Any, indexPath: IndexPath)
}
