//
//  AppEvent.swift
//  MarvelApp
//
//  Created by Renato Matos de Paula on 31/07/19.
//  Copyright © 2019 Renato Matos de Paula. All rights reserved.
//

import Foundation

enum AppEventType {
    case deepLink
    case flow
}

protocol AppEvent {
    var type: AppEventType { get }
}
