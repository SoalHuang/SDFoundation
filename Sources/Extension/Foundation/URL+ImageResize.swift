//
//  URL+ImageResize.swift
//  SDFoundation
//
//  Created by SoalHunag on 2018/3/20.
//  Copyright © 2018年 SoalHuang. All rights reserved.
//

import Foundation

extension URL: SDExtensionCompatible { }

public extension SDExtension where T == URL {
    /**
     修改图片链接的图片尺寸
     let url = https://www.sample.icon_100x100.jpg
     print(url.sd.resize(120, 160))
     https://www.sample.icon_120x160.jpg
     */
    private static let separator = "_"
    func resize(_ width: Int, _ height: Int) -> URL {
        guard width > 0, height > 0 else {
            return base
        }
        var lastComponent = base.deletingPathExtension().lastPathComponent
        var elements = lastComponent.components(separatedBy: SDExtension<URL>.separator)
        if elements.count > 1 {
            elements.removeLast(1)
        }
        elements.append("\(width)x\(height)")
        lastComponent = elements.joined(separator: SDExtension<URL>.separator)
        var url = base.deletingLastPathComponent()
        url = url.appendingPathComponent(lastComponent)
        url = url.appendingPathExtension(base.pathExtension)
        return url
    }
}
