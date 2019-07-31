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
        return model.name ?? ""
    }
    
    init(with model: Heroe) {
        self.model = model
    }
}
