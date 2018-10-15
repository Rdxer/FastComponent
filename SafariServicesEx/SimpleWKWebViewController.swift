//
//  HomeBannerADViewController.swift
//  MOMAEducation
//
//  Created by Rdxer on 2017/11/17.
//  Copyright © 2017年 Rdxer. All rights reserved.
//

import UIKit
import WebKit
import SnapKit
import FastComponent


open class SimpleWKWebViewController: UIViewController {

    open var url:URL?
    open var hidesBarsOnSwipe = false
    open var request:URLRequest?
    open var webView:WKWebView? = WKWebView.init()
    open var progressView:UIProgressView?
    open var nController:UINavigationController?
    open var webViewEdgesEqSuperV = true
    
    /// let image =  FastComponentBundle.imageWithSelf(name: "nav_bar_back_icon")
    open var backImage:UIImage?
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
//        webView = WKWebView.init(frame: view.bounds)
        
        view.addSubview(webView!)
        
        webView?.snp.makeConstraints { (make) in
            if webViewEdgesEqSuperV {
                make.edges.equalToSuperview()
            }else{
                make.left.right.equalToSuperview()
                make.top.equalTo(topLayoutGuide.snp.bottom)
                make.bottom.equalTo(bottomLayoutGuide.snp.top)
            }
        }
        
        webView?.load(request ?? URLRequest.init(url: url!, cachePolicy: URLRequest.CachePolicy.reloadIgnoringLocalCacheData, timeoutInterval: 20))
        
        webView?.navigationDelegate = self
        webView?.uiDelegate = self;
        
        webView?.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
        
        progressView = UIProgressView(frame: CGRect(x: 0, y: 44-2, width: UIScreen.main.bounds.size.width, height: 2))
        
        progressView?.trackTintColor = UIColor.white
        progressView?.progressTintColor = UIColor.orange
        
        self.navigationController?.navigationBar
            .addSubview(progressView!)
        
        if let pv = progressView,let nvBar = self.navigationController?.navigationBar{
            pv.snp.makeConstraints { (make) in
                make.left.equalToSuperview()
                make.bottom.equalToSuperview()
                make.right.equalToSuperview()
                make.height.equalTo(1)
            }
        }
        
        if let backImage = backImage {
            goBackBarButton = UIBarButtonItem.init(image: backImage, style: .done, target: self, action: #selector(backItemPressed))
        }else{
            let image =  FastComponentBundle.imageWithSelf(name: "nav_bar_back_icon")
            goBackBarButton = UIBarButtonItem.init(image: image, style: .done, target: self, action: #selector(backItemPressed))
        }
        
        self.navigationItem.leftBarButtonItem = goBackBarButton
    }
    
    var goBackBarButton:UIBarButtonItem?
    
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if hidesBarsOnSwipe {
            navigationController?.hidesBarsOnSwipe = true
            nController = navigationController
        }
    }
    
    open override func viewDidDisappear(_ animated: Bool) {
        if hidesBarsOnSwipe {
            nController?.hidesBarsOnSwipe = false
        }
        super.viewDidDisappear(animated)
    }
    
    @objc func backItemPressed() {
        if webView?.canGoBack == true {
            webView?.goBack()
        }else{
            if let nav = self.navigationController {
                if nav.visibleViewController == self,nav.viewControllers.count == 1{
                    nav.dismiss(animated: true, completion: nil)
                }else{
                    nav.popViewController(animated: true)
                }
            }else{
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    open var wkwebview_preferredStatusBarStyle: UIStatusBarStyle = .default
    
    open override var preferredStatusBarStyle: UIStatusBarStyle{
        get{
            return wkwebview_preferredStatusBarStyle
        }
    }
    
    open override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if (keyPath == "estimatedProgress") {
            progressView?.isHidden = webView?.estimatedProgress == 1
            progressView?.setProgress(Float(webView?.estimatedProgress ?? 0), animated: true)
            print(webView?.estimatedProgress)
        }
    }
    deinit {
        print("SimpleWKWebViewController deinit")
        webView?.removeObserver(self, forKeyPath: "estimatedProgress")
        progressView?.reloadInputViews()
        progressView?.removeFromSuperview()
    }
}

extension SimpleWKWebViewController:WKUIDelegate,WKNavigationDelegate{
    open func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        progressView?.setProgress(0.0, animated: false)
        self.navigationItem.title = title ?? webView.title
        
        
    }
    
    public func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
        webView.reload()
    }
    
    public func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        
    }
    
    func clearCache() -> Void {
        URLCache.shared.removeAllCachedResponses();
        URLCache.shared.diskCapacity = 0;
        URLCache.shared.memoryCapacity = 0;
    }
}


