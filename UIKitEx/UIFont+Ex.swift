//
//  UIFont+Ex.swift
//  APP
//
//  Created by Rdxer on 2017/12/14.
//  Copyright © 2017年 Rdxer. All rights reserved.
//

import UIKit

public protocol XXFontResources {
    var toFont:UIFont{get}
}

extension Int:XXFontResources{
    public var toFont:UIFont{
        return UIFont.systemFont(ofSize: CGFloat.init(self))
    }
}

extension Double:XXFontResources{
    public var toFont:UIFont{
        return UIFont.systemFont(ofSize: CGFloat.init(self))
    }
}

extension CGFloat:XXFontResources{
    public var toFont:UIFont{
        return UIFont.systemFont(ofSize: self)
    }
}
