//
//  Data+Ext.swift
//  SDFoundation
//
//  Created by SoalHunag on 2018/3/19.
//  Copyright © 2018年 SoalHuang. All rights reserved.
//

import Foundation
import CommonCrypto

extension Data: SDExtensionCompatible { }

public extension SDExtension where T == Data {
    
    var sha1Value: String {
        var digest = [UInt8](repeating: 0, count: Int(CC_SHA1_DIGEST_LENGTH))
        CC_SHA1((base as NSData).bytes, CC_LONG(base.count), &digest)
        let output = NSMutableString(capacity: Int(CC_SHA1_DIGEST_LENGTH))
        for byte in digest {
            output.appendFormat("%02x", byte)
        }
        return output as String
    }
    
    /// Data -> Hex [%02hhx]
//    var hexString: String {
//        return base.withUnsafeBytes { $0.reduce("") { $0 + String(format: "%02hhx", $1) } }
//    }
    
    var base64Value: String {
        let base64String = base.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
        let real = base64String.replacingOccurrences(of: "+", with: "-").replacingOccurrences(of: "/", with: "_")
        return real
    }
}
