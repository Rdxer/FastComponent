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
}
