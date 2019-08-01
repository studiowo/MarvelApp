//
//  HeroeList.swift
//  MarvelApp
//
//  Created by Renato Matos de Paula on 30/07/19.
//  Copyright © 2019 Renato Matos de Paula. All rights reserved.
//

import Foundation
import SDK

struct HeroeList: Codable {
    var offset: Int?
    let limit: Int?
    let total: Int?
    let count: Int?
    var results: [Heroe]?
    
    mutating func addResults(_ heroes: [Heroe]) {
        guard let offset = self.offset else { return }
        self.offset = offset + heroes.count
        self.results?.append(contentsOf: heroes)
    }
}
