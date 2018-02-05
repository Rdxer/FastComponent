//
//  HomeBannerADViewController.swift
//  MOMAEducation
//
//  Created by Rdxer on 2017/11/17.
//  Copyright © 2017年 Rdxer. All rights reserved.
//

import UIKit
import WebKit


open class SimpleWKWebViewController: UIViewController {

    open var url:URL?
    open var hidesBarsOnSwipe = false
    open var request:URLRequest?
    open var webView  = WKWebView.init()
    open var progressView = UIProgressView()
    open var nController:UINavigationController?
    
    /// let image =  FastComponentBundle.imageWithSelf(name: "nav_bar_back_icon")
    open var backImage:UIImage?
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        clearCache()
        
        webView.frame = view.bounds
        
        view.addSubview(webView)
        
        webView.load(request ?? URLRequest.init(url: url!, cachePolicy: URLRequest.CachePolicy.reloadIgnoringLocalCacheData, timeoutInterval: 20))
        
        webView.navigationDelegate = self
        webView.uiDelegate = self;
        
        webView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
        
        progressView = UIProgressView(frame: CGRect(x: 0, y: 44-2, width: UIScreen.main.bounds.size.width, height: 2))
        progressView.trackTintColor = UIColor.white
        progressView.progressTintColor = UIColor.orange
        self.navigationController?.navigationBar
            .addSubview(progressView)
        
        
        
        var barButton:UIBarButtonItem?
        
        if let backImage = backImage {
            barButton = UIBarButtonItem.init(image: backImage, style: .done, target: self, action: #selector(backItemPressed))
        }else{
            let image =  FastComponentBundle.imageWithSelf(name: "nav_bar_back_icon")
            barButton = UIBarButtonItem.init(image: image, style: .done, target: self, action: #selector(backItemPressed))
        }
        
        self.navigationItem.leftBarButtonItem = barButton
    }

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
        if webView.canGoBack {
            webView.goBack()
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
    
    open override var preferredStatusBarStyle: UIStatusBarStyle{
        get{
            return .lightContent
        }
    }
    
    open override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if (keyPath == "estimatedProgress") {
            progressView.isHidden = webView.estimatedProgress == 1
            progressView.setProgress(Float(webView.estimatedProgress), animated: true)
            print(webView.estimatedProgress)
        }
    }
    deinit {
        print("SimpleWKWebViewController deinit")
        webView.removeObserver(self, forKeyPath: "estimatedProgress")
        progressView.reloadInputViews()
        progressView.removeFromSuperview()
    }
}

extension SimpleWKWebViewController:WKUIDelegate,WKNavigationDelegate{
    open func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        progressView.setProgress(0.0, animated: false)
        self.navigationItem.title = title ?? webView.title
    }
    
    public func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
        webView.reload()
    }
    func clearCache() -> Void {
        URLCache.shared.removeAllCachedResponses();
        URLCache.shared.diskCapacity = 0;
        URLCache.shared.memoryCapacity = 0;
    }
}


