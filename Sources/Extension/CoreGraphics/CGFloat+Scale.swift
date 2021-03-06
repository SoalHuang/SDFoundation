//
//  CGFloat+SD.swift
//  SDFoundation
//
//  Created by SoalHunag on 2018/3/16.
//  Copyright © 2018年 SoalHuang. All rights reserved.
//

import UIKit.UIGeometry
import CoreGraphics

extension CGFloat: SDExtensionCompatible { }

public extension SDExtension where T == CGFloat {
    
    /// CGFloat(ceilf(Float(self)))
    var ceil: T { return CGFloat(ceilf(Float(base))) }
    
    /// CGFloat(floorf(Float(self)))
    var floor: T { return CGFloat(floorf(Float(base))) }
    
    /// CGFloat(lroundf(Float(self)))
    var round: T { return CGFloat(lroundf(Float(base))) }
    
    /// CGPoint(x: self, y: self)
    var point: CGPoint { return CGPoint(x: base, y: base) }
    
    /// CGSize(width: self, height: self)
    var size: CGSize  { return CGSize(width: base, height: base) }
    
    /// CGRect(x: 0, y: 0, width: self, height: self)
    var square: CGRect  { return CGRect(x: 0, y: 0, width: base, height: base) }
    
    /// UIEdgeInsets(top: self, left: self, bottom: self, right: self)
    var insets: UIEdgeInsets { return UIEdgeInsets(top: base, left: base, bottom: base, right: base) }
}

public extension SDExtension where T == CGFloat {
    
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

public extension SDExtension where T == CGFloat {
    
    /// UIFont.systemFont(ofSize: self)
    var font: UIFont { return UIFont.systemFont(ofSize: base) }
    
    /// UIFont.boldSystemFont(ofSize: self)
    var boldFont: UIFont { return UIFont.boldSystemFont(ofSize: base) }
}

//public extension SDExtension where T == Array<CGFloat> {
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
