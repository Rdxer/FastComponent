//
//  Bundle+Ex.swift
//  APP
//
//  Created by LXF on 2018/1/19.
//  Copyright © 2018年 Rdxer. All rights reserved.
//

import UIKit

extension Bundle{
    
    public static var cacheBundlePath:[String:URL] = [:]
    
    public static func subBundle(name:String)->URL {
        var suburl = cacheBundlePath[name]
        
        if suburl == nil {
            suburl = main.url(forResource: name, withExtension: "bundle")
            cacheBundlePath[name] = suburl
        }
        
        if suburl == nil {
            let bundle = Bundle.init(for: WeakNodeAttach.self)
            suburl = bundle.url(forResource: name, withExtension: "bundle")
            cacheBundlePath[name] = suburl
        }
        
        assert(suburl != nil, "subBundle (\(name)) 未找到")
        
        return suburl!
    }
}

extension UIImage{
    public convenience init?(subBundle subBundleName:String,named name: String) {
        self.init(contentsOfFile: Bundle.subBundle(name: subBundleName).appendingPathComponent(name).path)
        
    }
}

extension String{
    public func imageWithSelf(name:String?)->UIImage?{
        return UIImage.init(subBundle: self, named: name ?? "")
    }
}
