//
//  NSObject+Ex+Tag.swift
//  APP
//
//  Created by LXF on 2018/1/4.
//  Copyright © 2018年 Rdxer. All rights reserved.
//

import Foundation
import FastComponent

private var XX_Ex_Tag_Key: String = "FastComponent.XX_Ex_Tag_Key"
public extension XXExtension where Base:NSObject{
    
    /// 附属物品  - RETAIN_NONATOMIC
    public var tag:Any? {
        get {
            return objc_getAssociatedObject(self.base, &XX_Ex_Tag_Key)
        }
        set {
            objc_setAssociatedObject(self.base, &XX_Ex_Tag_Key, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

