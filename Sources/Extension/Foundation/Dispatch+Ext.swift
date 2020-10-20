//
//  Dispatch+Ext.swift
//  SDFoundation
//
//  Created by SoalHunag on 2018/3/20.
//  Copyright © 2018年 SoalHuang. All rights reserved.
//

import Foundation

public extension SDExtension where T: DispatchQueue {
    
    /// async after second
    func delay(_ second: TimeInterval, _ callback: @escaping () -> ()) {
        let microSeconds = second * TimeInterval(NSEC_PER_MSEC)
        let deadline = DispatchTime.now() + .microseconds(Int(microSeconds))
        base.asyncAfter(deadline: deadline, execute: callback)
    }
}
