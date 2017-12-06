//
//  AppTheme.swift
//  Pods
//
//  Created by Rdxer on 2017/8/4.
//
//

import UIKit

@objc
open class AppTheme:NSObject,AppThemeProtocol
{
    
//    open static var `default`:AppTheme! {
//        get{
//            return AppThemeManager.shared.default
//        }
//    }
    
    // MARK: -
    // MARK: - color  :  AppThemeProtocol
    
    /// 主题色
    open var primary:UIColor!
    /// 主题色 - 暗色
    open var primary_dark:UIColor!
    /// 主题色 - 亮色
    open var primary_light:UIColor!
    /// 强调色
    open var accent:UIColor!
    /// 文本色
    open var primary_text:UIColor!
    /// 次级文本色
    open var secondary_text:UIColor!
    /// 图标
    open var icons:UIColor!
    /// 分割线
    open var divider:UIColor!
    
    // MARK: -
    // MARK: - initial
    open var dict:[String:String]
    
    public init(dict:[String:String]) {
        self.dict = dict
        super.init()
        setColor()
    }
    
    public init(fileName:String = "app_color_main_theme.xml") {
        dict = [:]
        super.init()
        let parser = XMLParser.init(contentsOf: Bundle.main.url(forResource: fileName, withExtension: nil)!)
        parser!.delegate = self
        parser!.parse()
        setColor()
    }
    
    func setColor(){
        primary = UIColor.init(dict["primary"]!)!
        primary_dark = UIColor.init(dict["primary_dark"]!)!
        primary_light = UIColor.init(dict["primary_light"]!)!
        accent = UIColor.init(dict["accent"]!)!
        primary_text = UIColor.init(dict["primary_text"]!)!
        secondary_text = UIColor.init(dict["secondary_text"]!)!
        icons = UIColor.init(dict["icons"]!)!
        divider = UIColor.init(dict["divider"]!)!
    }
    
    public func becomeDefaultTheme(){
        UIColor.theme = self
    }
    
    public var key:String?
}

extension AppTheme:XMLParserDelegate{
    public func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        if elementName == "color" {
            key = attributeDict["name"]
        }
    }
    
    public func parser(_ parser: XMLParser, foundCharacters string: String) {
        if let keyName = key {
            let str = string.trimmingCharacters(in: .whitespacesAndNewlines)
            if str != "" {
                dict[keyName] = str
            }
        }
        
    }
}


