//
//  Enum+Ext.swift
//  SDFoundation
//
//  Created by SoalHunag on 2018/5/9.
//  Copyright © 2018年 SoalHuang. All rights reserved.
//

import Foundation

#if swift(>=4.2)
/// nothing
#else
public protocol CaseIterable {
    associatedtype AllCases: Collection where AllCases.Element == Self
    static var allCases: AllCases { get }
}

public extension CaseIterable where Self: Hashable {
    static var allCases: [Self] {
        return [Self](AnySequence { () -> AnyIterator<Self> in
            var raw = -1
            return AnyIterator {
                raw += 1
                return withUnsafeBytes(of: &raw) { $0.load(as: Self.self) }
            }
        })
    }
}
#endif
