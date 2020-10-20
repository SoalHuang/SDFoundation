//
//  String+Ext.swift
//  SDFoundation
//
//  Created by SoalHunag on 2018/3/16.
//  Copyright © 2018年 SoalHuang. All rights reserved.
//

import Foundation
import CommonCrypto

extension String: SDExtensionCompatible { }


// MARK: URL Image Size
public extension SDExtension where T == String {
    /**
     修改图片链接的图片尺寸
     let str = https://www.putao.icloud.icon_100x100.jpg
     let new = str.resize(120, 120)
     print(new)
     https://www.putao.icloud.icon_120x120.jpg
     */
    func resize(_ width: Int, _ height: Int) -> String {
        guard let url = URL(string: base) else {
            return base
        }
        return url.sd.resize(width, height).absoluteString
    }
}


// MARK: String Encode
public extension SDExtension where T == String {
    
    /// MD5
    var md5: String {
        return base.md5
    }
    
//    func hmac(_ algorithm: HMACAlgorithm, key: String) -> String {
//        return base.hmac(algorithm, key: key)
//    }
    
    /// encoding urlHostAllowed
    var urlEscaped: String {
        return base.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    /// "0" -> true; "*" -> false
    var isNumeric: Bool {
        guard !base.isEmpty else { return false }
        return base.trimmingCharacters(in: .decimalDigits).isEmpty
    }
    
    /// trimming whitespaces
    var trim: String {
        return base.trimmingCharacters(in: .whitespaces)
    }
    
    /// remove " "
    var withoutSpaces: String {
        return base.replacingOccurrences(of: " ", with: "")
    }
    
    /// trimming whitespacesAndNewlines
    var withoutSpaceAndNewlines: String {
        return base.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    /// remove "\r"、"\n"
    var removeNewLineString: String {
        return base.replacingOccurrences(of: "\r", with: "").replacingOccurrences(of: "\n", with: "")
    }
    
    /// trimming whitespacesAndNewlines, then remove "\r"、"\n"
    var trimmingString: String {
        return base.trimmingCharacters(in: .whitespacesAndNewlines).replacingOccurrences(of: "\r", with: "").replacingOccurrences(of: "\n", with: "")
    }
    
    func appendingPathComponent(_ path: String) -> String {
        return (base as NSString).appendingPathComponent(path)
    }
    
    func insert(_ string: String, at index: Int) -> String {
        return String(base.prefix(index)) + string + String(base.suffix(base.count - index))
    }
    
    /// encoding \"\'[]:/?&=;+!@#$()',*{}\\<>%^`
    var addingPercentEncoding: String? {
        return base.addingPercentEncoding(withAllowedCharacters: CharacterSet(charactersIn: "\"\'[]:/?&=;+!@#$()',*{}\\<>%^`").inverted)
    }
    
    /// string -> [String:String]
    var queryDictionary: [String: String] {
        guard
            let urlString = base.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
            let url = URL(string: urlString),
            let query = url.query else {
            return [:]
        }
        var temp = [String: String]()
        query.components(separatedBy: "&").forEach {
            let subComponent = $0.components(separatedBy: "=")
            if let key = subComponent.first?.removingPercentEncoding, let value = subComponent[safe: 1]?.removingPercentEncoding {
                temp[key] = value
            }
        }
        return temp
    }
    
    /// remove ^[\u{00000}-\u{FFFFF}]
    var removeNonBmpUnicode: String? {
        return base.replacingOccurrences(of: "^[\u{00000}-\u{FFFFF}]", with: "")
    }
}


// MARK: URL String
public extension SDExtension where T == String {
    
    /// -> url -> .scheme
    var scheme: String? {
        return URLComponents(string: base)?.scheme
    }
    
    /// -> url -> .host
    var host: String? {
        return URLComponents(string: base)?.host
    }
    
    /// -> url -> .query
    var query: String? {
        return URLComponents(string: base)?.query
    }
    
    /// -> url -> queryItems -> value for key
    func queryValue(for key: String) -> Int?  {
        return URLComponents(string: base)?.queryItems?.filter { $0.name == key }.first?.value?.intValue
    }
    
    func queryValue(for key: String) -> Float?  {
        return URLComponents(string: base)?.queryItems?.filter { $0.name == key }.first?.value?.floatValue
    }
    
    func queryValue(for key: String) -> Double?  {
        return URLComponents(string: base)?.queryItems?.filter { $0.name == key }.first?.value?.doubleValue
    }
    
    func queryValue(for key: String) -> String?  {
        return URLComponents(string: base)?.queryItems?.filter { $0.name == key }.first?.value
    }
}


// MARK: String Amount Format
public extension SDExtension where T == String {
    
    func dot(_ count: Int) -> T {
        let separator = "."
        let components = base.components(separatedBy: separator)
        if components.count > 2 { return base }
        let holder = "0"
        var first = components.first ?? holder
        if first.count == 0 {
            first = holder
        }
        let seconds = (components[safe: 1] ?? holder).compactMap({ $0.description })
        let last = (0..<count).compactMap { seconds[safe: $0] ?? holder }.joined()
        return [first, last].joined(separator: separator)
    }
}


public extension SDExtension where T == String {
    
    var intValue: Int? {
        return base.intValue
    }
    
    var floatValue: Float? {
        return base.floatValue
    }
    
    var doubleValue: Double? {
        return base.doubleValue
    }
}


extension String {
    
    var intValue: Int? {
        return Int(self)
    }
    
    var floatValue: Float? {
        return Float(self)
    }
    
    var doubleValue: Double? {
        return Double(self)
    }
}


public extension SDExtension where T == String {
    
    func toJsonObject() -> Any? {
        return base.toJsonObject()
    }
}


public extension SDExtension where T == String {
    
    func fill(_ placeholder: String) -> String {
        return base.fill(placeholder)
    }
    
    func fill(_ placeholder: Character, limit: Int) -> String {
        return base.fill(placeholder, limit: limit)
    }
    
    func insert(_ placeholder: Character, limit: Int) -> String {
        return base.insert(placeholder, limit: limit)
    }
}


extension String {
    
    var md5: String {
        let str = self.cString(using: String.Encoding.utf8) ?? []
        let strLen = CUnsignedInt(self.lengthOfBytes(using: String.Encoding.utf8))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digestLen)
        defer { result.deallocate() }
        CC_MD5(str, strLen, result)
        let hash = NSMutableString()
        for i in 0 ..< digestLen {
            hash.appendFormat("%02x", result[i])
        }
        return String(format: hash as String)
    }
    
//    func hmac(_ algorithm: HMACAlgorithm, key: String) -> String {
//        let cKey = key.cString(using: .utf8) ?? []
//        let cData = self.cString(using: .utf8) ?? []
//        var result = [CUnsignedChar](repeating: 0, count: algorithm.digestLength)
//        CCHmac(algorithm.toCCHmacAlgorithm, cKey, strlen(cKey), cData, strlen(cData), &result)
//        let hmacData:Data = Data(bytes: UnsafeRawPointer(result), count: (algorithm.digestLength))
//        let hmacBase64 = hmacData.base64EncodedString(options: .lineLength76Characters)
//        let real = hmacBase64.replacingOccurrences(of: "+", with: "-").replacingOccurrences(of: "/", with: "_")
//        return real
//    }
}


public enum HMACAlgorithm {
    
    case md5, sha1, sha224, sha256, sha384, sha512
    
    var toCCHmacAlgorithm: CCHmacAlgorithm {
        var result: Int = 0
        switch self {
        case .md5:
            result = kCCHmacAlgMD5
        case .sha1:
            result = kCCHmacAlgSHA1
        case .sha224:
            result = kCCHmacAlgSHA224
        case .sha256:
            result = kCCHmacAlgSHA256
        case .sha384:
            result = kCCHmacAlgSHA384
        case .sha512:
            result = kCCHmacAlgSHA512
        }
        return CCHmacAlgorithm(result)
    }
    
    var digestLength: Int {
        var result: CInt = 0
        switch self {
        case .md5:
            result = CC_MD5_DIGEST_LENGTH
        case .sha1:
            result = CC_SHA1_DIGEST_LENGTH
        case .sha224:
            result = CC_SHA224_DIGEST_LENGTH
        case .sha256:
            result = CC_SHA256_DIGEST_LENGTH
        case .sha384:
            result = CC_SHA384_DIGEST_LENGTH
        case .sha512:
            result = CC_SHA512_DIGEST_LENGTH
        }
        return Int(result)
    }
}


extension String {
    
    func toJsonObject() -> Any? {
        guard let data = data(using: .utf8) else { return nil }
        return try? JSONSerialization.jsonObject(with: data, options: [.mutableContainers, .mutableLeaves, .fragmentsAllowed])
    }
}

extension String {
    
    func fill(_ placeholder: String) -> String {
        if isEmpty { return placeholder }
        return self
    }
    
    func fill(_ placeholder: Character, limit: Int) -> String {
        let c = limit - count
        guard c > 0 else { return self }
        return (0..<c).reduce(self, { (r, _) in return r + "\(placeholder)" })
    }
    
    func insert(_ placeholder: Character, limit: Int) -> String {
        let c = limit - count
        guard c > 0 else { return self }
        return (0..<c).reduce(self, { (r, _) in return "\(placeholder)" + r })
    }
}

public extension SDExtension where T == String {
    
    var asError: Error {
        return NSError(domain: NSError.NormalErrorDomain, code: -1, description: base)
    }
    
    func asError(domain: String = NSError.NormalErrorDomain, code: Int = -1) -> Error {
        return NSError(domain: domain, code: code, description: base)
    }
}

public extension SDExtension where T == String {
    
    func firstComponent(separatedBy: String) -> String? {
        return base.components(separatedBy: separatedBy).first
    }
    
    func firstComponent(separatedBy: CharacterSet) -> String? {
        return base.components(separatedBy: separatedBy).first
    }
    
    func lastComponent(separatedBy: String) -> String? {
        return base.components(separatedBy: separatedBy).last
    }
    
    func lastComponent(separatedBy: CharacterSet) -> String? {
        return base.components(separatedBy: separatedBy).last
    }
}
