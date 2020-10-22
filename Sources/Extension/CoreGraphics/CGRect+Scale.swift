//
//  CGRect+SD.swift
//  SDFoundation
//
//  Created by SoalHunag on 2018/3/16.
//  Copyright © 2018年 SoalHuang. All rights reserved.
//

import UIKit.UIGeometry
import CoreGraphics

extension CGRect: SDExtensionCompatible { }

extension CGRect {
    
    public init(width: CGFloat, height: CGFloat) {
        self.init(x: 0, y: 0, width: width, height: height)
    }
    
    public init(center: CGPoint, size: CGSize) {
        self.init(origin: CGPoint(x: center.x - size.width * 0.5, y: center.y - size.height * 0.5), size: size)
    }
}

public extension CGRect {
    
    static func * (_ lhs: CGRect, _ rhs : CGFloat) -> CGRect {
        return CGRect(x: lhs.minX * rhs, y: lhs.minY * rhs, width: lhs.width * rhs, height: lhs.height * rhs)
    }
}

public extension SDExtension where T == CGRect {
    
    var top: CGFloat {
        get { return base.minY }
        set { base.origin.y = newValue }
    }
    
    var left: CGFloat {
        get { return base.minX }
        set { base.origin.x = newValue }
    }
    
    var bottom: CGFloat {
        get { return base.maxY }
        set { base.origin.y = newValue - base.height }
    }
    
    var right: CGFloat {
        get { return base.maxX }
        set { base.origin.x = newValue - base.width }
    }
    
    var center: CGPoint {
        get { return CGPoint(x: base.midX, y: base.midY) }
        set { base.origin = CGPoint(x: base.minX + newValue.x - base.midX, y: base.minY + newValue.y - base.midY) }
    }
    
    var centerX: CGFloat {
        get { return base.midX }
        set { base.origin.x = base.width - newValue }
    }
    
    var centerY: CGFloat {
        get { return base.midY }
        set { base.origin.y = base.height - newValue }
    }
}

public extension SDExtension where T == CGRect {
    
    var bounds: CGRect {
        return CGRect(width: base.width, height: base.height)
    }
}

public extension SDExtension where T == CGRect {
    
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

//public extension SDExtension where T == Array<CGRect> {
//    
//    var autoScale: [T.Element] {
//        return scale(AutoScale)
//    }
//    
//    var autoScaleMax: [T.Element] {
//        return scale(AutoScaleMax)
//    }
//    
//    func scale(_ scale: CGFloat) -> [T.Element] {
//        return base.compactMap { $0 * scale }
//    }
//}
