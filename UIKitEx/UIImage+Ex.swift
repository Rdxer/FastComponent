//
//  UIImage+Ex.swift
//  Pods
//
//  Created by Rdxer on 2017/8/15.
//
//

import UIKit

public extension XXExtension where Base : UIImage{
    public func toIcon() -> UIImage{
        return base.withRenderingMode(.alwaysTemplate)
    }
}
