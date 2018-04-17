//
//  UIAlertController+Ex+iPad.swift
//  APP
//
//  Created by LXF on 2018/1/18.
//  Copyright © 2018年 Rdxer. All rights reserved.
//

import Foundation
import Device

public extension UIViewController{
    /// 兼容 ipad alertVC
    public func present(alertVC:UIAlertController,sourceView:UIView){
        alertVC.presentAt(vc: self, sourceView: sourceView)
    }
    
    /// 兼容 ipad UIActivityViewController
    public func present(avc:UIActivityViewController,sourceView:UIView){
        avc.presentAt(vc: self, sourceView: sourceView)
    }
}

public extension UIActivityViewController{
    /// 兼容 ipad UIActivityViewController
    public func presentAt(vc:UIViewController,sourceView:UIView){
        if Device.isPad() {
            
            let popPresenter = popoverPresentationController
            
            popPresenter?.sourceView = sourceView
            popPresenter?.sourceRect = (popPresenter?.sourceView?.bounds) ?? .zero
            popPresenter?.permittedArrowDirections = .any
            
            vc.present(self, animated: true, completion: nil)
            
        }else{
            vc.present(self, animated: true, completion: nil)
        }
    }
}

public extension UIAlertController{
    /// 兼容 ipad alertVC
    public func presentAt(vc:UIViewController,sourceView:UIView){
        if Device.isPad() {
            
            let popPresenter = popoverPresentationController
            
            popPresenter?.sourceView = sourceView
            popPresenter?.sourceRect = (popPresenter?.sourceView?.bounds) ?? .zero
            
            vc.present(self, animated: true, completion: nil)
            
        }else{
            vc.present(self, animated: true, completion: nil)
        }
    }
}


