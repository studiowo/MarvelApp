//
//  CGFloat+Extensions.swift
//  MarvelApp
//
//  Created by Renato Matos de Paula on 02/08/19.
//  Copyright © 2019 Renato Matos de Paula. All rights reserved.
//

import CoreGraphics
import Foundation

extension CGFloat {
    
    public var evenRounded: CGFloat {
        var newValue = self.rounded(.towardZero)
        if newValue.truncatingRemainder(dividingBy: 2) == 1 {
            newValue -= 1
        }
        return newValue
    }
    
    public func interpolate(maxScroll: CGFloat, minScroll: CGFloat, max: CGFloat, min: CGFloat) -> CGFloat {
        if self <= maxScroll && self >= minScroll {
            return  max - ((self - minScroll) * ((max - min) / (maxScroll - minScroll)))
        } else if self > maxScroll {
            return min
        } else {
            return max
        }
    }
}
