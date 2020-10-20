//
//  CGPoint+SD.swift
//  SDFoundation
//
//  Created by SoalHunag on 2018/3/16.
//  Copyright © 2018年 SoalHuang. All rights reserved.
//

import UIKit.UIGeometry
import CoreGraphics

public extension CGPoint {
    
    static func * (_ lhs: CGPoint, _ rhs : CGFloat) -> CGPoint {
        return CGPoint(x: lhs.x * rhs, y: lhs.y * rhs)
    }
}

extension CGPoint: SDExtensionCompatible { }

public extension SDExtension where T == CGPoint {
    
    /// CGPoint(x: x.ceil, y: y.ceil)
    var ceil: T { return CGPoint(x: base.x.sd.ceil, y: base.y.sd.ceil) }
    
    /// CGPoint(x: x.floor, y: y.floor)
    var floor: T { return CGPoint(x: base.x.sd.floor, y: base.y.sd.floor) }
    
    /// CGPoint(x: x.round, y: y.round)
    var round: T { return CGPoint(x: base.x.sd.round, y: base.y.sd.round) }
}

public extension SDExtension where T == CGPoint {
    
    /// distance
    func distance(by point: T) -> CGFloat {
        return CGFloat(sqrt((point.x - base.x) * (point.x - base.x) + (point.y - base.y) * (point.y - base.y)))
    }
    
    /// atan((self.x - point.x) / (self.y - point.y))
    func angle(by point: T) -> CGFloat {
        return atan((base.x - point.x) / (base.y - point.y))
    }
}

public extension SDExtension where T == CGPoint {
    
    var autoScale: T {
        return scale(AutoScale)
    }
    
    var autoScaleMax: T {
        return scale(AutoScaleMax)
    }
    
    func scale(_ scale: CGFloat) -> T {
        return base * scale
    }
}

public extension SDExtension where T == Array<CGPoint> {
    
    var autoScale: [T.Element] {
        return scale(AutoScale)
    }
    
    var autoScaleMax: [T.Element] {
        return scale(AutoScaleMax)
    }
    
    func scale(_ scale: CGFloat) -> [T.Element] {
        return base.compactMap { $0 * scale }
    }
}
