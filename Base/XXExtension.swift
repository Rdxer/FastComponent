//
//  XXExtension.swift
//  Pods
//
//  Created by Rdxer on 2017/8/15.
//
//

import UIKit

public final class XXExtension<Base>{
    public let base: Base
    public var subscibeDeInit:((Base,XXExtension<Base>)->Void)?
    public init(_ base: Base) {
        self.base = base
    }
    
    deinit {
        subscibeDeInit?(base,self)
    }
}

public protocol XXExtensionCompatible {
    associatedtype CompatibleXXExtensionType
    var xx: CompatibleXXExtensionType { get }
}


private var XXExtensionCompatibleKey: Void?
public extension XXExtensionCompatible {
    public var xx: XXExtension<Self> {
//        get { return XXExtension(self) }
        
        /// 缓存 xx
        get {
            if let value = objc_getAssociatedObject(self, &XXExtensionCompatibleKey) as? XXExtension<Self>{
                return value
            }
            let value = XXExtension(self)
            objc_setAssociatedObject(self, &XXExtensionCompatibleKey, value, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            return value
        }
    }
}


extension NSObject:XXExtensionCompatible{}

