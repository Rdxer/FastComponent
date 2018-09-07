
//
//  SnapKit+Ex.swift
//  APP
//
//  Created by LXF on 2018/1/3.
//  Copyright © 2018年 Rdxer. All rights reserved.
//

import UIKit
import SnapKit
import FastComponent

public extension UIEdgeInsets{
    public func add(other addInset:UIEdgeInsets)->UIEdgeInsets{
        return UIEdgeInsetsMake(top+addInset.top, left+addInset.left, bottom+addInset.bottom, right+addInset.right)
    }
}

//  view.xx.layout xx
public extension XXExtension where Base:UIView {
    
    // MARK: -
    // MARK: - Vertical   ↓↓↓↓↓↓↓
    
    
    /// 垂直方向排布 subviews    ↓↓↓↓↓↓↓
    ///
    /// - Parameters:
    ///   - contentInset: 内部内容的边距, **** 只控制外框
    ///   - item: 每一个item的间距,每一个item的边框
    ///   - fill: 是否进行填充,默认 false,如果填充, 则 bottom.equalToSuperview,否则 bottom.lessThanOrEqualToSuperview
    ///   - center: 是否进行居中,默认 false,如果居中则只受 .left 影响
    ///   - itemSpacing: item 之间的间距
    public func layoutVerticalSubviews(contentInset:UIEdgeInsets = .zero,item:UIEdgeInsets = .zero,fill:Bool = false,center:Bool = false,itemSpacing: CGFloat = 0){
        layoutVertical(views: base.subviews, contentInset: contentInset, item: item,fill:fill,center:center,itemSpacing: itemSpacing)
    }
    
    /// 垂直方向排布 view    ↓↓↓↓↓↓↓
    ///
    /// - Parameters:
    ///   - views: 需要进行排布的 子 view
    ///   - contentInset: 内部内容的边距, **** 只控制外框
    ///   - item: 每一个item的间距,每一个item的边框
    ///   - fill: 是否进行填充,默认 false,如果填充, 则 bottom.equalToSuperview,否则 bottom.lessThanOrEqualToSuperview
    ///   - center: 是否进行居中,默认 false,如果居中则只受 .left 影响
    ///   - itemSpacing: item 之间的间距
    public func layoutVertical(views:[UIView]? = nil,contentInset:UIEdgeInsets = .zero,item:UIEdgeInsets = .zero,fill:Bool = false,center:Bool = false,itemSpacing: CGFloat = 0){
        
        guard let views = views?.nilOrNotEmpty else {
            XXLoger.e(" 需要布局的 view 为空!!! ")
            return
        }
        
        /// 内容间距 + 子项间距
        let sumInset = contentInset.add(other: item)
    
        
        views.first?.snp.makeConstraints({ (make) in
            make.top.equalToSuperview().offset(sumInset.top)
            
            
            if center {
                make.centerX.equalToSuperview()
                    .offset(sumInset.left)
            }else{
                make.left.equalToSuperview().offset(sumInset.left)
                make.right.equalToSuperview().offset(sumInset.right)
            }
            
        })
        
        views.safe_List(from: 1).forEach { (index,v) in
            v.snp.makeConstraints({ (make) in
                
                //  *****   核心
                /// 已经从 1 开始  所以不需要 - 1
                let previouView = views[index]
                
                make.top.equalTo(previouView.snp.bottom)
                    .offset(item.top+item.bottom+itemSpacing)
                
                if center {
                    make.centerX.equalToSuperview()
                        .offset(sumInset.left)
                }else{
                    make.left.equalToSuperview()
                        .offset(sumInset.left)
                    make.right.equalToSuperview()
                        .offset(sumInset.right)
                }
                
            })
        }
        
        views.last?.snp.makeConstraints({ (make) in
            if fill {
                make.bottom.equalToSuperview()
                    .offset(sumInset.bottom)
            }else{
                make.bottom.lessThanOrEqualToSuperview()
                    .offset(sumInset.bottom)
            }
        })
        
    }
    
    // MARK: -
    // MARK: - Horizontal   →→→→→→→→
    
    /// 水平方向排布 subviews   →→→→→→→→
    public func layoutHorizontalSubviews(contentInset:UIEdgeInsets = .zero,item:UIEdgeInsets = .zero,fill:Bool = false,center:Bool = false,itemSpacing: CGFloat = 0){
        layoutHorizontal(views: base.subviews, contentInset: contentInset, item: item,fill:fill,center:center,itemSpacing: itemSpacing)
    }
    
    /// 水平方向排布 view  →→→→→→→→
    public func layoutHorizontal(views:[UIView]? = nil,contentInset:UIEdgeInsets = .zero,item:UIEdgeInsets = .zero,fill:Bool = false,center:Bool = false,itemSpacing: CGFloat = 0){
        guard let views = views?.nilOrNotEmpty else {
            XXLoger.e(" 需要布局的 view 为空!!! ")
            return
        }
        
        let sumInset = contentInset.add(other: item)
        
        views.first?.snp.makeConstraints({ (make) in
            make.left.equalToSuperview().offset(sumInset.left)
            
            if center {
                make.centerY.equalToSuperview().offset(sumInset.top)
            }else{
                make.top.equalToSuperview().offset(sumInset.top)
                make.bottom.equalToSuperview()
                    .offset(sumInset.bottom)
            }
        })
        
        views.safe_List(from: 1).forEach { (index,v) in
            v.snp.makeConstraints({ (make) in
                
                //  *****   核心
                /// 已经从 1 开始  所以不需要 - 1
                
                make.left.equalTo(views[index].snp.right)
                    .offset(item.left+item.right+itemSpacing)
                
                if center {
                    make.centerY.equalToSuperview()
                        .offset(sumInset.top)
                }else{
                    make.top.equalToSuperview()
                        .offset(sumInset.top)
                    make.bottom.equalToSuperview()
                        .offset(sumInset.bottom)
                }
            })
        }
        
        views.last?.snp.makeConstraints({ (make) in
            if fill {
                make.right.equalToSuperview().offset(sumInset.right)
            }else{
                make.right.lessThanOrEqualToSuperview()
                    .offset(sumInset.right)
            }
        })
        
    }
    
}
