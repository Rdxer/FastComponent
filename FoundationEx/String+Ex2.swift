//
//  String+Ex.swift
//  APP
//
//  Created by Rdxer on 2017/12/14.
//  Copyright © 2017年 Rdxer. All rights reserved.
//

import Foundation

public extension String{
    /// 返回 长度 > 0 的字符串或者 nil
    var nilOrNotEmptyString:String?{
        return self.isEmpty ? nil : self
    }
}

public extension Substring{
    /// 返回 长度 > 0 的字符串或者 nil
    var nilOrNotEmptyString:String?{
        return self.isEmpty ? nil : String(self)
    }
}

public extension String{
    /// 安全的取数组范围的 字符串  开区间:   [fromIndex,toIndex)
    public func cut(from fromIndex:Int = -1,to toIndex:Int = Int.max)->String{
        
        if count == 0 {
            return ""
        }
        
        var res:String = ""
        
        for index in 0..<self.count {
            if (index > fromIndex && index < toIndex) || index == fromIndex{
                let strIndex = self.index(self.startIndex, offsetBy: index)
                let c = self[strIndex]
                res.append(c)
            }
        }
        
        return res
    }
}

public extension String{
    /// 返回 nsstring
    var asNSString:NSString{
        return self as NSString
    }
    
}
