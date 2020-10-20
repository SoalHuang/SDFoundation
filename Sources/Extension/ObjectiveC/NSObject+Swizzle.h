//
//  NSObject+Swizzle.h
//  SDFoundation
//
//  Created by SoalHunag on 2018/3/19.
//  Copyright © 2018年 SoalHuang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject(Swizzled)

/// 方法附加
+ (void)doSwizzle:(SEL)originalSelector with:(SEL)swizzledSelector;

@end
