//
//  WeakNode.swift
//  Pods
//
//  Created by Rdxer on 2017/8/15.
//
//

import Foundation

open class XXWeakNodeList<T:NSObject>: NSObject {
    
}

public protocol XXWeakNodeDelegate {
    func weakNodeDidDischarge<Key>(token:Key)
}

/// 弱引用节点
open class XXWeakNode<T:NSObject,Key>: NSObject {
    public weak var object:T?
    public var token:Key
    public var delegate:XXWeakNodeDelegate?
    public var receivedWeakNodeDischarge:((_ token:Key)->Void)?
    
    public init(object:T,token:Key,delegate:XXWeakNodeDelegate?) {
        self.object = object
        self.token = token
        self.delegate = delegate
        super.init()
        self.object?.___weakNodeAttach = XXWeakNodeAttach.init(delegate: self)
    }
    
    public init(object:T,token:Key,receivedWeakNodeDischarge:((_ token:Key)->Void)?) {
        self.object = object
        self.token = token
        self.receivedWeakNodeDischarge = receivedWeakNodeDischarge
        super.init()
        self.object?.___weakNodeAttach = XXWeakNodeAttach.init(delegate: self)
    }
    
}

extension XXWeakNode:XXWeakNodeAttachDelegate{
    func weakNodeAttachDidDischarge(attach: XXWeakNodeAttach) {
        delegate?.weakNodeDidDischarge(token: token)
        receivedWeakNodeDischarge?(token)
    }
}


protocol XXWeakNodeAttachDelegate {
    func weakNodeAttachDidDischarge(attach:XXWeakNodeAttach)
}

/// 附加对象
open class XXWeakNodeAttach: NSObject {
    
    var delegate:XXWeakNodeAttachDelegate
    
    init(delegate:XXWeakNodeAttachDelegate) {
        self.delegate = delegate
    }
    
    deinit {
        delegate.weakNodeAttachDidDischarge(attach: self)
    }
}


fileprivate var ___weakNodeAttachKey:Void?
/// 附加到 NSObject 身上
extension NSObject{
    var ___weakNodeAttach: XXWeakNodeAttach? {
        get {
            return objc_getAssociatedObject(self, &___weakNodeAttachKey) as? XXWeakNodeAttach
        }
        set {
            objc_setAssociatedObject(self, &___weakNodeAttachKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
