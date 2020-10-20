//
//  SDExtensionBase.swift
//  SDUIKit
//
//  Created by SoalHunag on 2018/3/19.
//  Copyright © 2018年 SoalHuang. All rights reserved.
//

import Foundation.NSObject

public struct SDExtension<T> {
    
    public var base: T
    
    public init(_ base: T) {
        self.base = base
    }
}

public protocol SDExtensionCompatible {
    
    associatedtype CompatibleType
    
    static var sd: SDExtension<CompatibleType>.Type { get set }
    
    var sd: SDExtension<CompatibleType> { get set }
}

extension SDExtensionCompatible {
    
    public static var sd: SDExtension<Self>.Type {
        get { return SDExtension<Self>.self }
        set {  }
    }
    
    public var sd: SDExtension<Self> {
        get { return SDExtension(self) }
        set {  }
    }
}

extension NSObject: SDExtensionCompatible {  }
