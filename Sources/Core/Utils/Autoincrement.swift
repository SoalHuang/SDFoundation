//
//  Autoincrement.swift
//  SDFoundation
//
//  Created by SoalHunag on 2020/5/8.
//  Copyright © 2020 SoalHunag. All rights reserved.
//

import Foundation

public struct Autoincrement {
    
    private static var currentId: Int = 0
    
    public static var id: Int {
        currentId += 1
        return currentId
    }
}
