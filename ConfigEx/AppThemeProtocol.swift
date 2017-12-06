//
//  AppThemeProtocol.swift
//  Pods
//
//  Created by Rdxer on 2017/8/4.
//
//

import UIKit

@objc public protocol AppThemeProtocol {
    /// 主题色
    var primary:UIColor { set get }
    /// 主题色 - 暗色
    var primary_dark:UIColor { get }
    /// 主题色 - 亮色
    var primary_light:UIColor { get }
    /// 强调色
    var accent:UIColor { get }
    /// 文本色
    var primary_text:UIColor { get }
    /// 次级文本色
    var secondary_text:UIColor { get }
    /// 图标
    var icons:UIColor { get }
    /// 分割线
    var divider:UIColor { get }
}


private var colorThemekey: Void?

public extension UIColor{
    public static var theme: AppThemeProtocol! {
        get {
            return objc_getAssociatedObject(self, &colorThemekey) as? AppThemeProtocol
        }
        set {
            objc_setAssociatedObject(self, &colorThemekey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

