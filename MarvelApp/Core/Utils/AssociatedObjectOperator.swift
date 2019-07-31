//
//  AssociatedObject.swift
//  MarvelApp
//
//  Created by Renato Matos de Paula on 29/07/19.
//  Copyright © 2019 Renato Matos de Paula. All rights reserved.
//

import Foundation

precedencegroup Precedence {
    associativity: left
    higherThan: LogicalConjunctionPrecedence
}

infix operator --> : Precedence

final class Handler<T> {
    init(_ value: T) {
        self.value = value
    }
    
    private(set) var value: T
}

private extension String {
    var associativeKey: UnsafeRawPointer? {
        return UnsafeRawPointer(bitPattern: hashValue)
    }
}

func --> <T>(object: AnyObject, key: String) -> T? {
    if let associativeKey = key.associativeKey, let v = objc_getAssociatedObject(object, associativeKey)
        as? Handler<T> {
        return v.value
    } else {
        return nil
    }
}
func --> <T>(object: AnyObject, dict: [String: T?]) {
    for (key,value) in dict {
        if let associativeKey = key.associativeKey {
            if value == nil {
                objc_setAssociatedObject(object, associativeKey,
                                         nil,
                                         .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            } else {
                objc_setAssociatedObject(object, associativeKey,
                                         Handler(value!),
                                         .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
}
