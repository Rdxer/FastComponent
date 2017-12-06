//
//  UITableView+PullToRefresh.swift
//  XXQrcode
//
//  Created by Rdxer on 2017/6/7.
//  Copyright © 2017年 Rdxer. All rights reserved.
//

import DGElasticPullToRefresh




private var XXloadingViewKey: Void?
public extension XXExtension where Base:UIScrollView{
    
    public var loadingView:DGElasticPullToRefreshLoadingViewCircle? {
        get {
            return objc_getAssociatedObject(base, &XXloadingViewKey) as? DGElasticPullToRefreshLoadingViewCircle
        }
        set {
            objc_setAssociatedObject(base, &XXloadingViewKey, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
    }
    
}


public extension XXExtension where Base:UIScrollView{

    public func addPullToRefresh<T:UIScrollView>(loadingViewBg:UIColor = Color.theme.icons,refreshFillColor:UIColor=Color.theme.primary_dark, refreshBackgroundColor:UIColor? = nil,actionHandler: @escaping (_ view:T?) -> Void) {
        
        let loadingView = DGElasticPullToRefreshLoadingViewCircle()

        base.dg_addPullToRefreshWithActionHandler({ () -> Void in
            actionHandler(self.base as? T)
        }, loadingView: loadingView)
        
        loadingView.tintColor = loadingViewBg
        base.dg_setPullToRefreshFillColor(refreshFillColor)
        base.dg_setPullToRefreshBackgroundColor(refreshBackgroundColor ?? base.backgroundColor ?? UIColor.clear)
        self.loadingView = loadingView
    }
    
    
    /// deinit 调用
    public func removePullToRefresh() {
        base.dg_removePullToRefresh()
    }
    
    public func setPullToRefreshBackgroundColor(_ color: UIColor) {
        base.dg_setPullToRefreshBackgroundColor(color)
    }
    
    public func setPullToRefreshFillColor(_ color: UIColor) {
        base.dg_setPullToRefreshFillColor(color)
    }
    
    public func stopLoading() {
        base.dg_stopLoading()
    }
    
}




