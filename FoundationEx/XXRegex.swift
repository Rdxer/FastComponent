//
//  XXRegex.swift
//  XXSync
//
//  Created by Rdxer on 2017/8/11.
//  Copyright © 2017年 Rdxer. All rights reserved.
//

import Foundation

public enum XXRegexVerifyType:String {
    case PhoneNumber = "^1[0-9]{10}$"
    case Email = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
    case HTTPS = "^(https?:\\/\\/)?([\\da-z\\.-]+)\\.([a-z\\.]{2,6})([\\/\\w \\.-]*)*\\/?$"
    case HTTP = "^(http?:\\/\\/)?([\\da-z\\.-]+)\\.([a-z\\.]{2,6})([\\/\\w \\.-]*)*\\/?$"

    /// 允许使用小写字母、数字、下滑线、横杠，一共6~20个字符
    case Password = "^[a-z0-9_-]{6,20}$"
}

public struct XXRegex {
    let regex: NSRegularExpression?
    
    init(_ pattern: String) {
        regex = try! NSRegularExpression.init(pattern: pattern, options: .caseInsensitive)
    }
    
    func match(input: String) -> Bool {
        if let matches = regex?.matches(in: input, options: [], range: NSRange.init(location: 0, length: input.characters.count)) {
            return matches.count > 0
        } else {
            return false
        }
    }
}


// MARK: -
// MARK: -  自定义运算符
precedencegroup XXComparativePrecedence {
    associativity: right
    higherThan: LogicalConjunctionPrecedence
}

// 模糊比较(会自动去空格,换行符等)
infix operator =~ : XXComparativePrecedence

public func =~(allText: String, rgx: XXRegexVerifyType) -> Bool {
    return allText =~ rgx.rawValue
}
public func =~(allText: String, rgx: String) -> Bool {
    return XXRegex(rgx.trimmingCharacters(in: .whitespacesAndNewlines)).match(input: allText.trimmingCharacters(in: .whitespacesAndNewlines))
}

// 严格比较
infix operator ==~ : XXComparativePrecedence

public func ==~(allText: String, rgx: XXRegexVerifyType) -> Bool {
    return allText ==~ rgx.rawValue
}

public func ==~(allText: String, rgx: String) -> Bool {
    return XXRegex(rgx).match(input: allText)
}


