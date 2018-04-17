//
//  UIViewController.swift
//  APP
//
//  Created by LXF on 2018/1/8.
//  Copyright © 2018年 Rdxer. All rights reserved.
//

import UIKit
import FastComponent

public extension XXExtension where Base:UIViewController {
    
    /// 删除  默认动画 left
    public func deleteCell<T:NSObject>(tableView:UITableView?, dataList:inout [T],model:T,anim:UITableViewRowAnimation = .left){
        if let index = dataList.index(of: model){
            dataList.remove(at: index)
            DispatchQueue.main.async {
                tableView?.deleteRows(at: [IndexPath.init(row: index, section: 0)], with: anim)
            }
        }
    }
    
    /// 插入 默认动画 middle
    public func insertCell<T:NSObject>(tableView:UITableView?, dataList:inout [T],model:T,anim:UITableViewRowAnimation = UITableViewRowAnimation.middle){
        if let index = dataList.index(of: model){
            DispatchQueue.main.async {
                tableView?.insertRows(at: [IndexPath.init(row: index, section: 0)], with: anim)
            }
        }
    }
    
    /// 更新/重新加载 默认动画 fade
    public func updateCell<T:NSObject>(tableView:UITableView?, dataList:inout [T],model:T,anim:UITableViewRowAnimation = .fade){
        if let index = dataList.index(of: model){
            DispatchQueue.main.async {
                tableView?.reloadRows(at:[IndexPath.init(row: index, section: 0)], with: anim)
            }
        }
    }
}
