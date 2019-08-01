//
//  HeroeData.swift
//  MarvelApp
//
//  Created by Renato Matos de Paula on 01/08/19.
//  Copyright © 2019 Renato Matos de Paula. All rights reserved.
//

import Foundation
import SDK

struct HeroeData: Codable, Fetchable {
    let code: Int?
    let status: String?
    let copyright: String?
    let attributionText: String?
    let attributionHTML: String?
    let etag: String?
    let data: HeroeList?
}
