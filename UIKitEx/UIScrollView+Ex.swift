//
//  UIScrollView+Ex.swift
//  Pods
//
//  Created by Rdxer on 2017/8/4.
//
//

import UIKit
import Then


public extension UIScrollView{
    var contentInset_top: CGFloat {
        get {
            return contentInset.top
        }
        set {
            var _contentInset = contentInset
            _contentInset.top = newValue
            contentInset = _contentInset
        }
    }
    
    var contentInset_left: CGFloat {
        get {
            return contentInset.left
        }
        set {
            var _contentInset = contentInset
            _contentInset.left = newValue
            contentInset = _contentInset
        }
    }
    var contentInset_bottom: CGFloat {
        get {
            return contentInset.bottom
        }
        set {
            var _contentInset = contentInset
            _contentInset.bottom = newValue
            contentInset = _contentInset
        }
    }
    
    var contentInset_right: CGFloat {
        get {
            return contentInset.right
        }
        set {
            var _contentInset = contentInset
            _contentInset.right = newValue
            contentInset = _contentInset
        }
    }
    
    var contentOffset_x: CGFloat {
        get {
            return contentOffset.x
        }
        set {
            var _contentOffset = contentOffset
            _contentOffset.x = newValue
            contentOffset = _contentOffset
        }
    }
    
    var contentOffset_y: CGFloat {
        get {
            return contentOffset.y
        }
        set {
            var _contentOffset = contentOffset
            _contentOffset.y = newValue
            contentOffset = _contentOffset
        }
    }
    
    var contentSize_width: CGFloat {
        get {
            return contentSize.width
        }
        set {
            var _contentSize = contentSize
            _contentSize.width = newValue
            contentSize = _contentSize
        }
    }
    var contentSize_height: CGFloat {
        get {
            return contentSize.height
        }
        set {
            var _contentSize = contentSize
            _contentSize.height = newValue
            contentSize = _contentSize
        }
    }
}
