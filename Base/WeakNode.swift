//
//  WeakNode.swift
//  Pods
//
//  Created by Rdxer on 2017/8/15.
//
//

import Foundation

open class WeakNodeList<T:NSObject>: NSObject {
    
}


public protocol WeakNodeDelegate {
    func weakNodeDidDischarge<Key>(token:Key)
}

open class WeakNode<T:NSObject,Key>: NSObject {
    public weak var object:T?
    public var token:Key
    public var delegate:WeakNodeDelegate?
    public var receivedWeakNodeDischarge:((_ token:Key)->Void)?
    
    public init(object:T,token:Key,delegate:WeakNodeDelegate?) {
        self.object = object
        self.token = token
        self.delegate = delegate
        super.init()
        self.object?.___weakNodeAttach = WeakNodeAttach.init(delegate: self)
    }
    
    public init(object:T,token:Key,receivedWeakNodeDischarge:((_ token:Key)->Void)?) {
        self.object = object
        self.token = token
        self.receivedWeakNodeDischarge = receivedWeakNodeDischarge
        super.init()
        self.object?.___weakNodeAttach = WeakNodeAttach.init(delegate: self)
    }
    
}

extension WeakNode:WeakNodeAttachDelegate{
    func weakNodeAttachDidDischarge(attach: WeakNodeAttach) {
        delegate?.weakNodeDidDischarge(token: token)
        receivedWeakNodeDischarge?(token)
    }
}


protocol WeakNodeAttachDelegate {
    func weakNodeAttachDidDischarge(attach:WeakNodeAttach)
}

open class WeakNodeAttach: NSObject {
    
    var delegate:WeakNodeAttachDelegate
    
    init(delegate:WeakNodeAttachDelegate) {
        self.delegate = delegate
    }
    
    deinit {
        delegate.weakNodeAttachDidDischarge(attach: self)
    }
}


fileprivate var ___weakNodeAttachKey:Void?
extension NSObject{
    var ___weakNodeAttach: WeakNodeAttach? {
        get {
            return objc_getAssociatedObject(self, &___weakNodeAttachKey) as? WeakNodeAttach
        }
        set {
            objc_setAssociatedObject(self, &___weakNodeAttachKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
