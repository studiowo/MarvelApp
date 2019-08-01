//
//  HeroeDetailViewModel.swift
//  MarvelApp
//
//  Created by Renato Matos de Paula on 31/07/19.
//  Copyright © 2019 Renato Matos de Paula. All rights reserved.
//

import Foundation

class HeroeDetailViewModel {
    private let model: Heroe
    
    var title: String {
        return name
    }
    
    var name: String {
        return model.name ?? ""
    }
    
    var thumb: String {
        guard let thumb = model.thumbnail, let path = thumb.path, let ext = thumb.extension else {
            return ""
        }
        return "\(path).\(ext)"
    }
    
    private var sections: [CollectionViewSection] = []
    
    init(with model: Heroe) {
        self.model = model
    }
    
    //MARK: Bindings
    var updateSections: ((_ sections: [CollectionViewSection]) -> Void)? {
        didSet {
            configSections()
        }
    }
    
    //MARK: Config
    private func configSections() {
        let header = HeroeDetailViewViewModel((name: name, image: thumb))
        
        sections.append(CollectionViewSection(items: [header]))
        updateSections?(sections)
    }
}
