//
//  UINa.swift
//  Pods
//
//  Created by Rdxer on 2017/7/19.
//
//

import UIKit

public extension UINavigationController{
    open func pushViewController(vc viewController: UIViewController) {
        self.pushViewController(viewController, animated: true)
    }
}


