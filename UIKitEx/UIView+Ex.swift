//
//  String+Ex.swift
//  Pods
//
//  Created by Rdxer on 2017/7/18.
//
//

import UIKit

extension UIView{
    open func removeAllSubviews(){
        for item in self.subviews {
            item.removeFromSuperview()
        }
    }
    
    @discardableResult
    open func addSubviews(_ subviews:[UIView?])->UIView{
        for item in subviews.filter({$0 != nil}).map({$0!}) {
            addSubview(item)
        }
        return self
    }
    
}


public extension XXExtension where Base:UIView{
    
    var height:CGFloat{
        get{
            return base.frame.height
        }
        set{
            var frame = base.frame
            frame.size.height = newValue
            base.frame = frame
        }
    }
    var width:CGFloat{
        get{
            return base.frame.width
        }
        set{
            var frame = base.frame
            frame.size.width = newValue
            base.frame = frame
        }
    }
    
    var x:CGFloat{
        get{
            return base.frame.origin.x
        }
        set{
            var frame = base.frame
            frame.origin.x = newValue
            base.frame = frame
        }
    }
    
    var y:CGFloat{
        get{
            return base.frame.origin.y
        }
        set{
            var frame = base.frame
            frame.origin.y = newValue
            base.frame = frame
        }
    }
    
    var frame:CGRect{
        get{
            return base.frame
        }
    }
}
