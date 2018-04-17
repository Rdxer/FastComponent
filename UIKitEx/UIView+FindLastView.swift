//
//  UIView+PreviousView.swift
//  APP
//
//  Created by LXF on 2018/1/2.
//  Copyright © 2018年 Rdxer. All rights reserved.
//

import UIKit

/// 方便布局
public extension UIView {

    /// 从 superview 找到自己的上一个 view
    public var lastView:UIView?{
        if let sv = superview {
            if let index = sv.subviews.index(of: self){
                return sv.subviews.safe(index: index-1)
            }
        }
        return nil
    }
    
//    open func lastView(find callback:(UIView)->()){
//        if let lastV = lastView {
//            callback(lastV)
//        }
//    }
    public func lastView(find callback:(UIView)->(),notFoundCallback:(()->())? = nil){
        if let lastV = lastView {
            callback(lastV)
        }else{
            notFoundCallback?()
        }
    }
}
