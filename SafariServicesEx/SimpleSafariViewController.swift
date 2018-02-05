//
//  SimpleSafariViewController.swift
//  AccountBook
//
//  Created by LXF on 2018/2/5.
//  Copyright © 2018年 LXF. All rights reserved.
//

import Foundation
import SafariServices

/**
 
 let vc = SimpleSafariViewController.init(url: URL.init(string: "https://www.baidu.com")!)
 present(vc, animated: true, completion: nil)
 
 */
@available(iOS 9.0, *)
open class SimpleSafariViewController: SFSafariViewController {
    override open func viewDidLoad() {
        super.viewDidLoad()
    }
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}
