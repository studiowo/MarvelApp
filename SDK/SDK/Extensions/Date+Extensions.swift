//
//  Date+Extensions.swift
//  SDK
//
//  Created by Renato Matos de Paula on 01/08/19.
//  Copyright © 2019 Renato Matos. All rights reserved.
//

import Foundation

extension Date {
    func currentTimeMillis() -> Int64 {
        return Int64(self.timeIntervalSince1970 * 1000)
    }
}
