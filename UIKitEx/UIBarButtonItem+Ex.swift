//
//  File.swift
//
//  Created by LXF on 2018/1/15.
//  Copyright © 2018年 Rdxer. All rights reserved.
//

import UIKit

public extension UIBarButtonItem{
    
    /// normal 状态下的  TitleText font
    public var font:UIFont?{
        get{
            return nil
        }
        set{
            if let font = newValue {
                setTitleTextAttributes(
                    [NSAttributedStringKey.font : font], for: .normal)
            }
        }
    }
    
    /// normal 状态下的  TitleText foregroundColor 前景色 / 文本颜色
    public var titleColor:UIColor?{
        get{
            return nil
        }
        set{
            if let color = newValue {
                setTitleTextAttributes(
                    [NSAttributedStringKey.foregroundColor : color], for: .normal)
            }
        }
    }
    
}
