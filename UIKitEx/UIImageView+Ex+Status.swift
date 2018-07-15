//
//  UIImageView+Ex+Status.swift
//  APP
//
//  Created by LXF on 2018/1/15.
//  Copyright © 2018年 Rdxer. All rights reserved.
//

import Foundation
import FastComponent

private var XX_Ex_ImageView_Status_Image_List_Key: Void?
public extension XXExtension where Base:UIImageView{

    /// 普通状态
    public var normalImage: UIImage? {
        get {
            return (statusImageMap?[UIControlState.normal.rawValue]) ?? nil
        }// UIControlState
        set {
            statusImageMap?[UIControlState.normal.rawValue] = newValue
            if state == nil {
                state = UIControlState.normal
            }
        }
    }
    
    /// 选中状态
    public var selectedImage: UIImage? {
        get {
            return (statusImageMap?[UIControlState.selected.rawValue]) ?? nil
        }// UIControlState
        set {
            statusImageMap?[UIControlState.selected.rawValue] = newValue
            let s = self.state
            self.state = s
        }
    }
    /// 选中状态
    public var highlightedImage: UIImage? {
        get {
            return (statusImageMap?[UIControlState.highlighted.rawValue]) ?? nil
        }
        set {
            statusImageMap?[UIControlState.highlighted.rawValue] = newValue
            let s = self.state
            self.state = s
        }
    }
    
    /// 状态 <> image Map
    public var statusImageMap:[UInt:UIImage?]? {
        get {
            
            var list = objc_getAssociatedObject(self, &XX_Ex_ImageView_Status_Image_List_Key) as? [UInt : UIImage?]
            
            if list == nil {
                list = [:]
            }
            
            return list
        }
        set {
            objc_setAssociatedObject(self, &XX_Ex_ImageView_Status_Image_List_Key, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    /// 设置/获取当前状态 or  获取当前状态
    /// 设置为 nil 则 隐藏图片
    /// 值为 nil 则 为 隐藏状态中
    public var state:UIControlState?{
        set{
            
            guard let stateV = newValue?.rawValue else{
                base.image = nil
                return
            }
            
            if let image = statusImageMap?[stateV] {
                base.image = image
            }else{
                base.image = (statusImageMap?[UIControlState.normal.rawValue]) ?? nil
            }
        }
        get{
            
            for (key,value) in statusImageMap ?? [:]  {
                if value == base.image{
                    return UIControlState.init(rawValue: key)
                }
            }
            if base.image == nil {
                return nil
            }
            return UIControlState.normal
        }
    }
    


}

