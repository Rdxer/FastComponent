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
    
    open func addSubviews(_ subviews:[UIView?]){
        for item in subviews.filter({$0 != nil}).map({$0!}) {
            addSubview(item)
        }
    }
    
}
