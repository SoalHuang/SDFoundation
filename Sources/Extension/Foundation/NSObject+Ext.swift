//
//  NSObject+Ext.swift
//  SDFoundation
//
//  Created by SoalHunag on 2020/4/30.
//  Copyright © 2020 SoalHunag. All rights reserved.
//

import Foundation

public protocol ClassNameable {
    
    var className: String? { get }
}

public extension SDExtension where T: ClassNameable {
    
    var className: String? {
        return base.className
    }
}

extension NSObject: ClassNameable {
    
    public var className: String? {
        return "\(self.classForCoder)"
    }
}
