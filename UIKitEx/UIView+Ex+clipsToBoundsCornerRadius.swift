//
//  UIView+Ex.swift
//  APP
//
//  Created by LXF on 2018/1/3.
//  Copyright © 2018年 Rdxer. All rights reserved.
//

import UIKit

extension UIView {

    public var clipsToBoundsCornerRadius:CGFloat{
        get{
            return self.layer.cornerRadius
        }
        set{
            self.clipsToBounds = true
            self.layer.cornerRadius = newValue
        }
    }
}


