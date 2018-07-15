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
    var dispose:DisposeBag {get set}
}

public extension Disposable {
    public func disposed(by bag: DisposeBagOwner) {
        disposed(by: bag.dispose)
    }
}

extension NSObject:DisposeBagOwner{
    
    open var dispose:DisposeBag {
        get {
            return xx.dispose
        }
        set {
            xx.dispose = newValue
        }
    }

    open func resetDisposeBag(){
        dispose = DisposeBag.init()
    }
}

private var XXDisposableKey: Void?
public extension XXExtension where Base:NSObject{
    
    public var dispose:DisposeBag {
        get {
            if let value = objc_getAssociatedObject(self, &XXDisposableKey) as? DisposeBag{
                return value
            }
            let value = DisposeBag.init()
            self.dispose = value
            return value
        }
        set {
            objc_setAssociatedObject(self, &XXDisposableKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
}
