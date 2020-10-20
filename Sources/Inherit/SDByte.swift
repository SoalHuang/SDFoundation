//
//  SDByte.swift
//  SDFoundation
//
//  Created by SoalHunag on 2020/6/19.
//  Copyright © 2020 SoalHunag. All rights reserved.
//

import Foundation
import CoreGraphics

public let KB_P:    SDByte = SDByte(1024)
public let MB_P:    SDByte = 1024 * KB_P
public let GB_P:    SDByte = 1024 * MB_P
public let TB_P:    SDByte = 1024 * GB_P

public func MB_P(_ multiplie: UInt64) ->   SDByte { return MB_P * multiplie }
public func GB_P(_ multiplie: UInt64) ->   SDByte { return GB_P * multiplie }
public func TB_P(_ multiplie: UInt64) ->   SDByte { return TB_P * multiplie }

public struct SDByte {
    
    public private(set) var bytes: UInt64
    
    public init(_ bytes: UInt64) {
        self.bytes = bytes
    }
}

extension SDByte: CustomStringConvertible {
    
    public var description: String {
        let cb = [(TB_P, "T"), (GB_P, "G"), (MB_P, "M"), (KB_P, "K")]
        guard let c = cb.filter({ $0.0.bytes <= bytes }).first else {
            return "\(bytes)B"
        }
        return String(format: "%.2f%@", (Double(bytes) / Double(c.0.bytes)), c.1)
    }
}

extension SDByte: CustomDebugStringConvertible {
    
    public var debugDescription: String {
        return "\(bytes)B"
    }
}

extension SDByte: Equatable {
    
    public static func == (lhs: SDByte, rhs: SDByte) -> Bool {
        return lhs.bytes == rhs.bytes
    }
    
    public static func != (lhs: SDByte, rhs: SDByte) -> Bool {
        return lhs.bytes != rhs.bytes
    }
}

extension SDByte: Comparable {
    
    public static func < (lhs: SDByte, rhs: SDByte) -> Bool {
        return lhs.bytes < rhs.bytes
    }
    
    public static func <= (lhs: SDByte, rhs: SDByte) -> Bool {
        return lhs.bytes <= rhs.bytes
    }
    
    public static func > (lhs: SDByte, rhs: SDByte) -> Bool {
        return lhs.bytes > rhs.bytes
    }
    
    public static func >= (lhs: SDByte, rhs: SDByte) -> Bool {
        return lhs.bytes >= rhs.bytes
    }
}

public extension SDByte {
    
    static func + (lhs: SDByte, rhs: SDByte) -> SDByte {
        return SDByte(lhs.bytes + rhs.bytes)
    }
    
    static func += (lhs: inout SDByte, rhs: SDByte) {
        lhs.bytes += rhs.bytes
    }
    
    static func - (lhs: SDByte, rhs: SDByte) -> SDByte {
        return SDByte(lhs.bytes - rhs.bytes)
    }
    
    static func -= (lhs: inout SDByte, rhs: SDByte) {
        lhs.bytes -= rhs.bytes
    }
    
    static func * (lhs: SDByte, rhs: SDByte) -> SDByte {
        return SDByte(lhs.bytes * rhs.bytes)
    }
    
    static func *= (lhs: inout SDByte, rhs: SDByte) {
        lhs.bytes *= rhs.bytes
    }
    
    static func / (lhs: SDByte, rhs: SDByte) -> SDByte {
        return SDByte(lhs.bytes / rhs.bytes)
    }
    
    static func /= (lhs: inout SDByte, rhs: SDByte) {
        lhs.bytes /= rhs.bytes
    }
    
    prefix static func + (x: SDByte) -> SDByte {
        return SDByte(+x.bytes)
    }
    
    static func * (lhs: UInt64, rhs: SDByte) -> SDByte {
        return SDByte(lhs * rhs.bytes)
    }
    
    static func * (lhs: SDByte, rhs: UInt64) -> SDByte {
        return SDByte(lhs.bytes * rhs)
    }
}

public extension SDByte {
    
    var tb: UInt64 { return bytes / TB_P.bytes }
    
    var gb: UInt64 { return (bytes % TB_P.bytes) / GB_P.bytes }
    
    var mb: UInt64 { return (bytes % GB_P.bytes) / MB_P.bytes }
    
    var kb: UInt64 { return (bytes % MB_P.bytes) / KB_P.bytes }
    
    var bt: UInt64 { return bytes % KB_P.bytes }
}

public extension UInt64 {
    
    var bytes: SDByte { return SDByte(self) }
}

public extension Int {
    
    var bytes: SDByte { return SDByte(UInt64(self)) }
}
