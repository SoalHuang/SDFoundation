//
//  NSPredicate+Ext.swift
//  SDFoundation
//
//  Created by SoalHunag on 2020/4/30.
//  Copyright © 2020 SoalHunag. All rights reserved.
//

import Foundation

extension NSPredicate {
    
    public static let nickname = NSPredicate(format: "SELF MATCHES %@", "^[\u{4E00}-\u{9FA5}A-Za-z]{1,7}$")
}
