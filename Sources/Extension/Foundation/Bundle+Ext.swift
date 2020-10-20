//
//  Bundle+Ext.swift
//  SDFoundation
//
//  Created by SoalHunag on 2018/3/21.
//  Copyright © 2018年 SoalHuang. All rights reserved.
//

import Foundation

public extension SDExtension where T: Bundle {
    
    /// value for CFBundleShortVersionString
    var version: String? {
        return base.infoDictionary?["CFBundleShortVersionString"] as? String
    }
    
    /// value for kCFBundleVersionKey
    var build: String? {
        return base.infoDictionary?[kCFBundleVersionKey as String] as? String
    }
    
    /// value for kCFBundleIdentifierKey
    var identifier: String? {
        return base.infoDictionary?[kCFBundleIdentifierKey as String] as? String
    }
    
    /// value for CFBundleDisplayName
    var displayName: String? {
        return base.infoDictionary?["CFBundleDisplayName"] as? String
    }
}
