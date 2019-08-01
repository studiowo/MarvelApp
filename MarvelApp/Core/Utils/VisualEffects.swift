//
//  VisualEffects.swift
//  MarvelApp
//
//  Created by Renato Matos de Paula on 01/08/19.
//  Copyright © 2019 Renato Matos de Paula. All rights reserved.
//

import UIKit

enum VisualEffectStyles {
    case `default`(_ style: UIBlurEffect.Style)
    case custom(_ style: UIBlurEffect.Style, intensity: CGFloat)
}

struct VisualEffect {
    static public func effect(style: VisualEffectStyles = .default(.dark)) -> UIVisualEffectView {
        switch style {
        case .default(let style):
            return CustomVisualEffectView(effect: UIBlurEffect(style: style), intensity: 1)
        case .custom(let style, let intensity):
            return CustomVisualEffectView(effect: UIBlurEffect(style: style), intensity: intensity)
        }
    }
}
