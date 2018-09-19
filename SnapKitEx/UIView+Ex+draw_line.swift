//
//  UIView+Ex+Line.swift
//  APP
//
//  Created by Rdxer on 2017/12/7.
//  Copyright © 2017年 Rdxer. All rights reserved.
//

import UIKit
import SnapKit


public enum XXUIViewDivider {
    case top
    case left
    case bottom
    case right
}

public extension XXExtension where Base:UIView{
    @discardableResult
    public func add(divider:XXUIViewDivider = .bottom,
                       dividerColor:UIColor,
                       dividerWidth:CGFloat = 0.5,
                       dividerEdgeInset:UIEdgeInsets = UIEdgeInsets.zero)->UIView{
        
        var dividerView = dividerViewList[divider.hashValue]
        if nil == dividerView {
            dividerView = UIView.init()
            dividerViewList[divider.hashValue] = dividerView
        }
        
        dividerView?.backgroundColor = dividerColor
        
        base.addSubview(dividerView!)
        
        switch divider {
        case .top:
            dividerView?.snp.remakeConstraints({ (make) in
                make.left.equalToSuperview().offset(dividerEdgeInset.left)
                make.right.equalToSuperview().offset(dividerEdgeInset.right)
                make.top.equalToSuperview().offset(dividerEdgeInset.top)
                make.height.equalTo(dividerWidth)
            })
        
        case .left:
            dividerView?.snp.remakeConstraints({ (make) in
                
                make.left.equalToSuperview().offset(dividerEdgeInset.left)
                make.bottom.equalToSuperview().offset(dividerEdgeInset.bottom)
                make.top.equalToSuperview().offset(dividerEdgeInset.top)
                
                make.width.equalTo(dividerWidth)
            })
        
        case .bottom:
            dividerView?.snp.remakeConstraints({ (make) in
//                make.left.right.bottom.equalToSuperview()
                
                make.left.equalToSuperview().offset(dividerEdgeInset.left)
                make.bottom.equalToSuperview().offset(dividerEdgeInset.bottom)
                make.right.equalToSuperview().offset(dividerEdgeInset.right)

                
                make.height.equalTo(dividerWidth)
            })
        
        case .right:
            dividerView?.snp.remakeConstraints({ (make) in
                
//                make.right.bottom.top.equalToSuperview()
                
                make.top.equalToSuperview().offset(dividerEdgeInset.top)
                make.bottom.equalToSuperview().offset(dividerEdgeInset.bottom)
                make.right.equalToSuperview().offset(dividerEdgeInset.right)
                
                make.width.equalTo(dividerWidth)
            })
        }
        return dividerView!
    }
    
    public func add(dividerList:[XXUIViewDivider],dividerColorList:[UIColor],dividerWidthList:[CGFloat]){
        for index in 0..<dividerList.count {
            add(divider: dividerList[index], dividerColor: dividerColorList[index],dividerWidth: dividerWidthList[index])
        }
    }
    public func add(dividerList:[XXUIViewDivider],
                       dividerColor:UIColor = UIColor.gray,
                       dividerWidth:CGFloat = 0.5){
        for index in 0..<dividerList.count {
            add(divider: dividerList[index], dividerColor: dividerColor,dividerWidth:dividerWidth)
        }
    }
    public func remove(dividerList:[XXUIViewDivider]){
        for item in dividerList {
            let view = dividerViewList[item.hashValue]
            view?.removeFromSuperview()
        }
    }
}

/// 存储所用
private var _XXUIViewDividerKey: Void?

public extension XXExtension where Base:UIView{
    public var dividerViewList: [Int:UIView] {
        get {
            var list = objc_getAssociatedObject(self.base, &_XXUIViewDividerKey) as? [Int:UIView]
            if list == nil{
                list = [:]
                dividerViewList = list!
            }
            return list!
        }
        set {
            objc_setAssociatedObject(self.base, &_XXUIViewDividerKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
