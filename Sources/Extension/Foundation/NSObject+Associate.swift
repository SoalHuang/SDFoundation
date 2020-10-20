//
//  NSObject+Associate.swift
//  SDFoundation
//
//  Created by SoalHunag on 2018/3/19.
//  Copyright © 2018年 SoalHuang. All rights reserved.
//

import Foundation

private struct SDObjectAssociateKeys {
    
    static var tag:     String = "object.sd.tag"
    static var info:    String = "object.sd.info"
}

public extension SDExtension where T: NSObject {
    
    /// associated object
    var tag: Int {
        get { return base.sd.binded(for: &SDObjectAssociateKeys.tag) ?? 0 }
        set { base.sd.bind(object: newValue, for: &SDObjectAssociateKeys.tag, .OBJC_ASSOCIATION_COPY_NONATOMIC) }
    }
    
    /// associated object
    var info: [AnyHashable:Any] {
        get { return base.sd.binded(for: &SDObjectAssociateKeys.info) ?? [:] }
        set { base.sd.bind(object: newValue, for: &SDObjectAssociateKeys.info, .OBJC_ASSOCIATION_COPY_NONATOMIC) }
    }
}

public extension SDExtension where T: NSObject {
    
    /// objc_getAssociatedObject(base, key)
    func binded<ResultType>(for key: UnsafeRawPointer) -> ResultType? {
        return objc_getAssociatedObject(base, key) as? ResultType
    }
    
    /// objc_setAssociatedObject(base, key, object, policy)
    func bind(object: Any?, for key: UnsafeRawPointer, _ policy: objc_AssociationPolicy) {
        objc_setAssociatedObject(base, key, object, policy)
    }
    
    /// objc_setAssociatedObject(base, key, nil, policy)
    func unBind(for key: UnsafeRawPointer, _ policy: objc_AssociationPolicy) {
        objc_setAssociatedObject(base, key, nil, policy)
    }
}
