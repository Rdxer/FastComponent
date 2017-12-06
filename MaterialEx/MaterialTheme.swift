//
//  Mater.swift
//  XXQrcode
//
//  Created by Rdxer on 2017/6/6.
//  Copyright © 2017年 Rdxer. All rights reserved.
//

import Material

@objc
public protocol AppSetTheme {
    func doSetTheme(theme:AppThemeProtocol)
}

public extension AppSetTheme{
    public func setTheme(theme: AppThemeProtocol = UIColor.theme)->Self{
        doSetTheme(theme: theme)
        return self
    }
}

extension Button:AppSetTheme{
    public  func doSetTheme(theme: AppThemeProtocol = UIColor.theme){
        pulseColor = theme.icons
        tintColor = theme.icons
    }
}

extension UINavigationBar:AppSetTheme{
    public func doSetTheme(theme: AppThemeProtocol = UIColor.theme){
        backgroundColor = theme.primary
    }
}

extension UINavigationItem:AppSetTheme{
    public func doSetTheme(theme: AppThemeProtocol = UIColor.theme){
        titleLabel.textColor = theme.icons
        detailLabel.textColor = theme.icons
    }
}


extension FABButton{
    public override func doSetTheme(theme: AppThemeProtocol){
        tintColor = theme.icons
        pulseColor = theme.icons
        backgroundColor = theme.accent
    }
}

extension Toolbar:AppSetTheme{
    public func doSetTheme(theme: AppThemeProtocol = UIColor.theme){
        titleLabel.textColor = theme.icons
        detailLabel.textColor = theme.icons
    }
}

