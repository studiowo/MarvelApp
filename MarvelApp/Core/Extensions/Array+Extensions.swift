//
//  Array+Extensions.swift
//  MarvelApp
//
//  Created by Renato Matos de Paula on 29/07/19.
//  Copyright © 2019 Renato Matos de Paula. All rights reserved.
//

import Foundation

extension Array {
    public func element(at index: Int) -> Element? {
        return index < self.count && index >= 0 ? self[index] : nil
    }
}
