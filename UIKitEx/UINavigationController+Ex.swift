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
    open func pushViewControllerFromSelfNVC(vc viewController: UIViewController?) {
        if let viewController = viewController {
            self.navigationController?.pushViewController(viewController, animated: true)
        }else{
            assertionFailure("viewController 不能为空")
        }
        
    }
}


