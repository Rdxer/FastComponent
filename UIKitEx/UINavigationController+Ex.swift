//
//  UINa.swift
//  Pods
//
//  Created by Rdxer on 2017/7/19.
//
//

import UIKit

public extension UINavigationController{
    @objc open func pushViewController(vc viewController: UIViewController) {
        self.pushViewController(viewController, animated: true)
    }
}
public extension UIViewController{
    open func pushViewControllerFromSelfNVC(vc viewController: UIViewController) {
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}


