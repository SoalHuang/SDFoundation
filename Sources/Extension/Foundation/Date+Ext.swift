//
//  Date+Ext.swift
//  SDFoundation
//
//  Created by SoalHunag on 2018/3/19.
//  Copyright © 2018年 SoalHuang. All rights reserved.
//

import Foundation

extension Date: SDExtensionCompatible { }

private let weekdays: Array = ["周日", "周一", "周二", "周三", "周四", "周五", "周六"]

public extension SDExtension where T == Date {
    
    /// 星期的index -> [1:日, 2:一, 3:二, ..., 7:六]
    var weekday: Int? {
        return Calendar(identifier: .chinese).dateComponents([.weekday], from: base).weekday
    }
    
    /// 星期的中文描述 -> ["周日", "周一", "周二", "周三", "周四", "周五", "周六"]
    var weekdayChineseDescription: String? {
        return weekdays[safe: (weekday ?? 0) - 1]
    }
}

public extension SDExtension where T == Date {
    
    var second: Second { return base.timeIntervalSince1970.second }
}
