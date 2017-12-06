//
//  UIScrollView+Ex.swift
//  Pods
//
//  Created by Rdxer on 2017/8/4.
//
//

import UIKit
import Then

public extension XXExtension where Base:UIScrollView{
    public var inset_top: CGFloat {
        get {
            return base.contentInset.top
        }
        set {
            var _contentInset = base.contentInset
            _contentInset.top = newValue
            base.contentInset = _contentInset
        }
    }
    
    public var inset_left: CGFloat {
        get {
            return base.contentInset.left
        }
        set {
            var _contentInset = base.contentInset 
            _contentInset.left = newValue
            base.contentInset = _contentInset
        }
    }
    public var inset_bottom: CGFloat {
        get {
            return base.contentInset.bottom
        }
        set {
            var _contentInset = base.contentInset 
            _contentInset.bottom = newValue
            base.contentInset = _contentInset
        }
    }
    
    public var inset_right: CGFloat {
        get {
            return base.contentInset.right
        }
        set {
            var _contentInset = base.contentInset 
            _contentInset.right = newValue
            base.contentInset = _contentInset
        }
    }
    
    public var offset_x: CGFloat {
        get {
            return base.contentOffset.x
        }
        set {
            var _contentOffset = base.contentOffset
            _contentOffset.x = newValue
            base.contentOffset = _contentOffset
        }
    }
    
    public var offset_y: CGFloat {
        get {
            return base.contentOffset.y
        }
        set {
            var _contentOffset = base.contentOffset
            _contentOffset.y = newValue
            base.contentOffset = _contentOffset
        }
    }
    
    public var size_width: CGFloat {
        get {
            return base.contentSize.width
        }
        set {
            var _contentSize = base.contentSize
            _contentSize.width = newValue
            base.contentSize = _contentSize
        }
    }
    public var size_height: CGFloat {
        get {
            return base.contentSize.height
        }
        set {
            var _contentSize = base.contentSize
            _contentSize.height = newValue
            base.contentSize = _contentSize
        }
    }
}
