//
//  LayoutSpacements.swift
//  MarvelApp
//
//  Created by Renato Matos de Paula on 29/07/19.
//  Copyright © 2019 Renato Matos de Paula. All rights reserved.
//

import UIKit

protocol GridProtocol {
    var margin: UIEdgeInsets { get }
    var padding: UIEdgeInsets { get }
    
    var verticalPadding: CGFloat { get }
    var horizontalPadding: CGFloat { get }
}

struct LayoutSpacements: GridProtocol {
    
    var margin: UIEdgeInsets {
        return .zero
    }
    
    var padding: UIEdgeInsets {
        return .zero
    }
    
    var verticalPadding: CGFloat {
        return self.padding.top + self.padding.bottom
    }
    
    var horizontalPadding: CGFloat {
        return self.padding.left + self.padding.right
    }
}
