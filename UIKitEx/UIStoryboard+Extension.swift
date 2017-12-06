//
//  UIViewController+Extension.swift
//  XXQrcode
//
//  Created by Rdxer on 2017/6/9.
//  Copyright © 2017年 Rdxer. All rights reserved.
//

import UIKit

public extension UIStoryboard{
    open func instantiateVC<T: UIViewController>(type: T.Type) -> T? {
        let id = String(describing: T.self)
        return instantiateViewController(withIdentifier: id) as? T
    }
}

public extension UIViewController{
    open func instantiateVC<T: UIViewController>(type: T.Type) -> T? {
        let id = String(describing: T.self)
        return storyboard?.instantiateViewController(withIdentifier: id) as? T
    }
}
