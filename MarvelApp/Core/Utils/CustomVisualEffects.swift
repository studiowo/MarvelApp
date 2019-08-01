//
//  CustomVisualEffects.swift
//  MarvelApp
//
//  Created by Renato Matos de Paula on 01/08/19.
//  Copyright © 2019 Renato Matos de Paula. All rights reserved.
//

import UIKit

open class CustomVisualEffectView: UIVisualEffectView {
    
    private var animator: UIViewPropertyAnimator?
    
    public init(effect: UIVisualEffect, intensity: CGFloat) {
        if #available(iOS 11.0, *) {
            super.init(effect: nil)
            animator = UIViewPropertyAnimator(duration: 1, curve: .linear) { [unowned self] in self.effect = effect }
            animator?.fractionComplete = intensity
        } else {
            super.init(effect: effect)
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
