//
//  String+Ex.swift
//  Pods
//
//  Created by Rdxer on 2017/7/18.
//
//

import Foundation


public extension String{
    /// to URL
    public var toUrl: URL? {
        return URL.init(string:self)
    }
}

public extension String{
    /// 去空格 & 换行符
    public var trim: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

