//
//  Global.swift
//  SDFoundation
//
//  Created by SoalHunag on 2018/3/21.
//  Copyright © 2018年 SoalHuang. All rights reserved.
//

import Foundation
import UIKit

public let DeviceIsiPhone4: Bool = (Int(max(UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height)) == 480)
public let DeviceIsiPhone5: Bool = (Int(max(UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height)) == 568)
public let DeviceIsiPhone6: Bool = (Int(max(UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height)) == 667)
public let DeviceIsiPhone6p: Bool = (Int(max(UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height)) == 736)
public let DeviceIsiPhoneX: Bool = (Int(max(UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height)) == 812)
public let DeviceIsiPhoneMX: Bool = (Int(max(UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height)) == 896)
public let DeviceIsXGroup: Bool = DeviceIsiPhoneX || DeviceIsiPhoneMX

public let DeviceIsPad: Bool = (UIDevice.current.userInterfaceIdiom ~= .pad)
public let DeviceIsPhone: Bool = (UIDevice.current.userInterfaceIdiom ~= .phone)

public func AppVersion() -> String? {
    return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
}

public func BundleVersion() -> String? {
    return Bundle.main.infoDictionary?[(kCFBundleVersionKey as NSString) as String] as? String
}

public func BundleIdentifier() -> String? {
    return Bundle.main.infoDictionary?[(kCFBundleIdentifierKey as NSString) as String] as? String
}

public func BundleDisplayName() -> String? {
    return Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String
}
