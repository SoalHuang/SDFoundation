//
//  CGSize+SD.swift
//  SDFoundation
//
//  Created by SoalHunag on 2018/3/16.
//  Copyright © 2018年 SoalHuang. All rights reserved.
//

import UIKit.UIGeometry
import CoreGraphics

public extension CGSize {
    
    static func * (_ lhs: CGSize, _ rhs : CGFloat) -> CGSize {
        return CGSize(width: lhs.width * rhs, height: lhs.height * rhs)
    }
}

extension CGSize: SDExtensionCompatible { }

public extension SDExtension where T == CGSize {
    
    /// CGSize(width: width.ceil, height: height.ceil)
    var ceil: T { return CGSize(width: base.width.sd.ceil, height: base.height.sd.ceil) }
    
    /// CGSize(width: width.floor, height: height.floor)
    var floor: T { return CGSize(width: base.width.sd.floor, height: base.height.sd.floor) }
    
    /// CGSize(width: width.round, height: height.round)
    var round: T { return CGSize(width: base.width.sd.round, height: base.height.sd.round) }
    
    /// CGRect(x: 0, y: 0, width: width, height: height)
    var bounds: CGRect { return CGRect(width: base.width, height: base.height) }
}

public extension SDExtension where T == CGSize {
    
    var autoScale: T {
        return scale(AutoScale)
    }
    
    var autoScaleMax: T {
        return scale(AutoScaleMax)
    }
    
    /// CGSize(width: self.width * scale, height: self.height * scale)
    func scale(_ scale: CGFloat) -> T {
        return base * scale
    }
    
    /// CGSize(width: self.width * widthScale, height: self.height * heightScale)
    func scale(_ widthScale: CGFloat, _ heightScale: CGFloat) -> T {
        return CGSize(width: base.width * widthScale, height: base.height * heightScale)
    }
}

public extension SDExtension where T == Array<CGSize> {
    
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
