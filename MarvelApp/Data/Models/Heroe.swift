//
//  Heroe.swift
//  MarvelApp
//
//  Created by Renato Matos de Paula on 30/07/19.
//  Copyright © 2019 Renato Matos de Paula. All rights reserved.
//

import Foundation
import SDK

struct Heroe: Codable {
    struct Cases: Codable {
        struct Items: Codable {
            let resourceURI: String?
            let name: String?
        }
        
        let available: Int?
        let collectionURI: String?
        let items: [Items]?
        let returned: Int?
    }
    
    struct Thumbnail: Codable {
        let path: String?
        let `extension`: String?
    }
    
    struct Url: Codable {
        let `type`: String?
        let url: String?
    }
    
    let id: Int?
    let name: String?
    let description: String?
    let thumbnail: Thumbnail?
    let resourceURI: String?
    let comics: Cases?
    let series: Cases?
    let stories: Cases?
    let events: Cases?
    let urls: [Url]?
}
