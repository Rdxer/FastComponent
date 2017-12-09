//
//  BaseSafariViewController.swift
//  Potatso
//
//  Created by LEI on 12/30/15.
//  Copyright © 2015 TouchingApp. All rights reserved.
//

import Foundation
import SafariServices

@available(iOS 9.0, *)
class BaseSafariViewController: SFSafariViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action:nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barStyle = .default
    }
    
}