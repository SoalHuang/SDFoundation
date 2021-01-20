//
//  NSError+Ext.swift
//  SDFoundation
//
//  Created by SoalHunag on 2020/4/28.
//  Copyright © 2020 SoalHunag. All rights reserved.
//

import Foundation

public extension NSError {
    
    static let NormalErrorDomain = "com.sd.domain"
    
    convenience init(domain: String = NormalErrorDomain, code: Int = -1, description: String? = nil) {
        if let desc = description {
            self.init(domain: domain, code: code, userInfo: ["statusCode": code, NSLocalizedDescriptionKey: desc])
        } else {
            self.init(domain: domain, code: code, userInfo: ["statusCode": code])
        }
    }
}
