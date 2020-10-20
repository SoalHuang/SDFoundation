//
//  WeakBox.swift
//  SDFoundation
//
//  Created by SoalHunag on 2020/5/8.
//  Copyright © 2020 SoalHunag. All rights reserved.
//

import Foundation

public struct WeakBox<T: NSObjectProtocol> {
    
    public weak var target: T?
    
    public init(target: T?) {
        self.target = target
    }
}
