//
//  Reachability+Network.swift
//  pchat
//
//  Created by SoalHunag on 2018/4/25.
//  Copyright © 2018年 SoalHuang. All rights reserved.
//

import Foundation
import CoreTelephony

public let reachability = Reachability()!

extension Reachability: SDExtensionCompatible { }

public extension SDExtension where T == Reachability {
    
    /// 运营商
    var carrierName: String {
        return CTTelephonyNetworkInfo().subscriberCellularProvider?.carrierName ?? "none"
    }
    
    /// 网络环境
    var network: String {
        switch base.currentReachabilityStatus {
        case .notReachable: return "none"
        case .reachableViaWiFi: return "wifi"
        case .reachableViaWWAN:
            guard let radio = CTTelephonyNetworkInfo().currentRadioAccessTechnology else {
                return "unknown"
            }
            switch radio {
            case CTRadioAccessTechnologyGPRS:           return "GPRS"
            case CTRadioAccessTechnologyEdge:           return "2.75G EDGE"
            case CTRadioAccessTechnologyWCDMA:          return "3G"
            case CTRadioAccessTechnologyHSDPA:          return "3.5G HSDPA"
            case CTRadioAccessTechnologyHSUPA:          return "3.5G HSUPA"
            case CTRadioAccessTechnologyCDMA1x:         return "2G"
            case CTRadioAccessTechnologyCDMAEVDORev0:   return "3G"
            case CTRadioAccessTechnologyCDMAEVDORevA:   return "3G"
            case CTRadioAccessTechnologyCDMAEVDORevB:   return "3G"
            case CTRadioAccessTechnologyeHRPD:          return "3.75G HRPD"
            case CTRadioAccessTechnologyLTE:            return "4G"
            default:                                    return "undefined"
            }
        }
    }
}
