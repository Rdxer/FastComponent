//
//  UIVisualEffectView+Ex.swift
//  APP
//
//  Created by LXF on 2018/1/10.
//  Copyright © 2018年 Rdxer. All rights reserved.
//

import Foundation
import UIKit

public extension UIVisualEffectView {
    
    open static func make(_ style:UIBlurEffectStyle = UIBlurEffectStyle.light)->UIVisualEffectView {
        let blur = UIBlurEffect.init(style: style)
        let blurView = self.init(effect: blur)
        return blurView
    }
    
    
}
