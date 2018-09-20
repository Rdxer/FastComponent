//
//  NSObject+RxSwift.swift
//  Pods
//
//  Created by Rdxer on 2017/8/15.
//
//

import UIKit
import RxSwift



public protocol DisposeBagOwner {
    var dispose:DisposeBag {get}
}

public extension Disposable {
    public func disposed(by bag: DisposeBagOwner?) {
        if let bagdispose = bag?.dispose {
            disposed(by: bagdispose)
        }
    }
}

extension NSObject:DisposeBagOwner{
    
    open var dispose:DisposeBag {
        get {
            return xx.dispose
        }
    }

    open func resetDisposeBag(){
        xx.dispose = DisposeBag.init()
    }
}

private var XXDisposableKey: Void?
private var XXDisposableKey_fixed_dispose: Void?
public extension XXExtension where Base:NSObject{
    
    public fileprivate(set) var dispose:DisposeBag {
        get {
            if let value = objc_getAssociatedObject(self.base, &XXDisposableKey) as? DisposeBag{
                return value
            }
            let value = DisposeBag.init()
            self.dispose = value
            return value
        }
        set {
            objc_setAssociatedObject(self.base, &XXDisposableKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    public fileprivate(set) var fixed_dispose:DisposeBag {
        get {
            if let value = objc_getAssociatedObject(self.base, &XXDisposableKey_fixed_dispose) as? DisposeBag{
                return value
            }
            let value = DisposeBag.init()
            self.fixed_dispose = value
            return value
        }
        set {
            objc_setAssociatedObject(self.base, &XXDisposableKey_fixed_dispose, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
