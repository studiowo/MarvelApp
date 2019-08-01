//
//  ApiFactory.swift
//  SDK
//
//  Created by Renato Matos de Paula on 01/08/19.
//  Copyright © 2019 Renato Matos. All rights reserved.
//

import Foundation
import var CommonCrypto.CC_MD5_DIGEST_LENGTH
import func CommonCrypto.CC_MD5
import typealias CommonCrypto.CC_LONG

public struct ApiFactory {
    static func getHash(ts: String, hash: String) -> String {
        return md5("\(ts)\(hash)")
    }
    
    internal static func md5(_ inString: String) -> String! {
        let str = inString.cString(using: String.Encoding.utf8)
        let strLen = CUnsignedInt(inString.lengthOfBytes(using: String.Encoding.utf8))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digestLen)
        CC_MD5(str!, strLen, result)
        let hash = NSMutableString()
        for i in 0..<digestLen {
            hash.appendFormat("%02x", result[i])
        }
        result.deallocate()
        return String(format: hash as String)
    }
}
