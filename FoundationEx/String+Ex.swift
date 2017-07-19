//
//  String+Ex.swift
//  Pods
//
//  Created by Rdxer on 2017/7/18.
//
//

import Foundation

public extension String{
    public var toUrl: URL? {
        return URL.init(string:self)
    }
}
