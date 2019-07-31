//
//  HeroeList.swift
//  MarvelApp
//
//  Created by Renato Matos de Paula on 30/07/19.
//  Copyright © 2019 Renato Matos de Paula. All rights reserved.
//

import Foundation
import SDK

struct HeroeList: Codable, Fetchable {
    let offset: Int?
    let limit: Int?
    let total: Int?
    let count: Int?
    let results: [Heroe]?
}
