//
//  Resource.swift
//  SDUIKit
//
//  Created by SoalHunag on 2019/12/16.
//  Copyright © 2019 SoalHuang. All rights reserved.
//

import Foundation

public enum Resource<Target> {
    
    case target(Target?)
    case url(URL)
    case path(String)
    case name(String)
}

public extension Resource {
    
    var target: Target? {
        guard case .target(let t) = self else { return nil }
        return t
    }
    
    var url: URL? {
        guard case .url(let u) = self else { return nil }
        return u
    }
    
    var path: String? {
        guard case .path(let p) = self else { return nil }
        return p
    }
    
    var name: String? {
        guard case .name(let n) = self else { return nil }
        return n
    }
}
