//
//  NSLock+Ext.swift
//  SDFoundation
//
//  Created by SoalHunag on 2018/8/23.
//  Copyright © 2018 SoalHuang. All rights reserved.
//

import Foundation

public extension SDExtension where T: NSLock {
    
    @discardableResult
    func lock<Element>(_ closure: () -> Element) -> Element {
        base.lock()
        defer { base.unlock() }
        return closure()
    }
    
    @discardableResult
    func lock<Element>(_ closure: @autoclosure () -> Element) -> Element {
        base.lock()
        defer { base.unlock() }
        return closure()
    }
}

public extension SDExtension where T: Any {
    
    @discardableResult
    func lock<Element>(_ lock: NSLock, _ closure: () -> Element) -> Element {
        lock.lock()
        defer { lock.unlock() }
        return closure()
    }
    
    @discardableResult
    func lock<Element>(_ lock: NSLock, _ closure: @autoclosure () -> Element) -> Element {
        lock.lock()
        defer { lock.unlock() }
        return closure()
    }
}
