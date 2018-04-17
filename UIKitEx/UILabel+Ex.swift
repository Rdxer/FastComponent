//
//  UILabel+Ex.swift
//  APP
//
//  Created by LXF on 2018/1/18.
//  Copyright © 2018年 Rdxer. All rights reserved.
//

import UIKit

public extension UILabel{
    /// 设置 字体 size
    public var fontSize:XXFontResources?{
        get{
            return font.pointSize
        }
        set{
            font = newValue?.toFont
        }
    }
}
