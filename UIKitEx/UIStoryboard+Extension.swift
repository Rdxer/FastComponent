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
        let id = String(describing: type)
        return instantiateViewController(withIdentifier: id) as? T
    }

    open static func instantiateVC<T: UIViewController>(type: T.Type) -> T? {
        let id = String(describing: type)
        let sb = UIStoryboard.init(name: id, bundle: nil)
        return sb.instantiateViewController(withIdentifier: id) as? T
    }
}


public extension UIViewController{
    open func instantiateFromStoryboard<T: UIViewController>(type: T.Type) -> T? {
//        let id = String(describing: T.self)
        let id = String(describing: type)
        return storyboard?.instantiateViewController(withIdentifier: id) as? T
    }
    open static func instantiateFromStoryboard<T>() -> T? {
        return UIStoryboard.instantiateVC(type: self) as? T
    }
}
