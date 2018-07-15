//
//  UIButton+Ex.swift
//  APP
//
//  Created by LXF on 2018/1/2.
//  Copyright © 2018年 Rdxer. All rights reserved.
//

import UIKit

public extension UIButton {
    
    
    /// 设置 mormal 的 title
    public var title: String? {
        get{
            return title(for: .normal)
        }
        set {
            setTitle(newValue, for: .normal)
        }
    }
    
    /// 设置 mormal 的 titleColor
    public var titleColor: UIColor? {
        get{
            return titleColor(for: .normal)
        }
        set {
            setTitleColor(newValue, for: .normal)
        }
    }
    
    /// 设置
    public var titleFont: UIFont? {
        get{
            return titleLabel?.font
        }
        set {
            titleLabel?.font = newValue
        }
    }
    
    
    
    /// 设置 normal image
    public var image: UIImage? {
        get{
            return image(for: .normal)
        }
        set {
            setImage(newValue, for: .normal)
        }
    }
    /// 设置 selected image
    public var image_selected: UIImage? {
        get{
            return image(for: .selected)
        }
        set {
            setImage(newValue, for: .selected)
        }
    }
    /// 设置 highlighted image
    public var image_highlighted: UIImage? {
        get{
            return image(for: .highlighted)
        }
        set {
            setImage(newValue, for: .highlighted)
        }
    }
    /// 设置图片 prefix + image_name + Suffix
    public func setImage(prefix: String? = nil,name: String, Sel selectedSuffix: String? = nil,Hl highlightSuffix: String? = nil){
        
        var name = name
        
        if let prefix = prefix {
            name = prefix + name
        }
        
        if let image = UIImage.init(named: name) {
            self.image = image
        }else{
            print(" 图片未找到 ~ (name) \(name)")
            assertionFailure(" 图片未找到 ~ (name) \(name)")
        }
        
        if let selectedSuffix = selectedSuffix {
            if let image = UIImage.init(named: name + selectedSuffix) {
                self.image_selected = image
            }else{
                print(" 图片未找到 ~ (selectedSuffix) \(name + selectedSuffix)")
                assertionFailure(" 图片未找到 ~ (selectedSuffix) \(name + selectedSuffix)")
            }
        }
        
       
        if let highlightSuffix = highlightSuffix {
            if let image = UIImage.init(named: name + highlightSuffix) {
                self.image_highlighted = image
            }else{
                print(" 图片未找到 ~ (highlightSuffix) \(name + highlightSuffix)")
                assertionFailure(" 图片未找到 ~ (highlightSuffix) \(name + highlightSuffix)")
            }
        }
        
    }
    
}
