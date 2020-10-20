//
//  CancelablePerformBox.swift
//  SDFoundation
//
//  Created by SoalHunag on 2020/5/8.
//  Copyright © 2020 SoalHunag. All rights reserved.
//

import Foundation

public protocol CancelablePerformBoxType {
    
    func cancel()
    func fire()
}

extension CancelablePerformBox: CancelablePerformBoxType {
    
    public func cancel() {
        NSObject.cancelPreviousPerformRequests(withTarget: self)
    }
    
    public func fire() {
        cancel()
        action()
    }
}

public class CancelablePerformBox: NSObject {
    
    let action: () -> Void
    
    public init(delay seconds: TimeInterval, _ closure: @escaping () -> Void) {
        action = closure
        super.init()
        perform(#selector(CancelablePerformBox.performAction), with: nil, afterDelay: seconds)
    }
    
    @objc
    private func performAction() {
        action()
    }
}
