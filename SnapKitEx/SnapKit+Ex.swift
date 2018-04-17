
//
//  SnapKit+Ex.swift
//  APP
//
//  Created by LXF on 2018/1/3.
//  Copyright © 2018年 Rdxer. All rights reserved.
//

import UIKit
import SnapKit
import XXLogger
import FastComponent

public extension UIEdgeInsets{
    public func add(other addInset:UIEdgeInsets)->UIEdgeInsets{
        return UIEdgeInsetsMake(top+addInset.top, left+addInset.left, bottom+addInset.bottom, right+addInset.right)
    }
}

public extension UIView {
    
    // MARK: -
    // MARK: - Vertical   ↓↓↓↓↓↓↓
    
    /// 垂直方向排布 subviews   ↓↓↓↓↓↓↓
    public func xx_layoutVerticalSubviews(contentInset:UIEdgeInsets = .zero,item:UIEdgeInsets = .zero,fill:Bool = false,center:Bool = false,itemSpacing: CGFloat = 0){
        xx_layoutVertical(views: self.subviews, contentInset: contentInset, item: item,fill:fill,center:center,itemSpacing: itemSpacing)
    }
    
    /// 垂直方向排布 view    ↓↓↓↓↓↓↓
    public func xx_layoutVertical(views:[UIView]? = nil,contentInset:UIEdgeInsets = .zero,item:UIEdgeInsets = .zero,fill:Bool = false,center:Bool = false,itemSpacing: CGFloat = 0){
        guard let views = views?.nilOrNotEmpty else {
            printE(" 需要布局的 view 为空!!! ")
            return
        }
        
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
                make.top.equalTo(views[index].snp.bottom)
                    .offset(item.top+item.bottom+itemSpacing)
                
//                make.left.equalToSuperview()
//                    .offset(sumInset.left)
//                make.right.equalToSuperview()
//                    .offset(sumInset.right)
                
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
    public func xx_layoutHorizontalSubviews(contentInset:UIEdgeInsets = .zero,item:UIEdgeInsets = .zero,fill:Bool = false,center:Bool = false,itemSpacing: CGFloat = 0){
        xx_layoutHorizontal(views: self.subviews, contentInset: contentInset, item: item,fill:fill,center:center,itemSpacing: itemSpacing)
    }
    
    /// 水平方向排布 view  →→→→→→→→
    public func xx_layoutHorizontal(views:[UIView]? = nil,contentInset:UIEdgeInsets = .zero,item:UIEdgeInsets = .zero,fill:Bool = false,center:Bool = false,itemSpacing: CGFloat = 0){
        guard let views = views?.nilOrNotEmpty else {
            printE(" 需要布局的 view 为空!!! ")
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
