//
//  UIEdgeInsets+Ex.swift
//  APP
//
//  Created by LXF on 2018/1/9.
//  Copyright © 2018年 Rdxer. All rights reserved.
//

import Foundation
import UIKit

public extension UIEdgeInsets{
    
    public init(t: CGFloat = 0, l: CGFloat = 0, b: CGFloat = 0, r: CGFloat = 0){
        self.init()
        self.top = t
        self.left = l
        self.bottom = b
        self.right = r
    }
    
    public init(edge v: CGFloat){
        self.init()
        self.top = v
        self.left = v
        self.bottom = v
        self.right = v
    }
}
