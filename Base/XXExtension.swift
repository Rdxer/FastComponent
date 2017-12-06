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
    public init(_ base: Base) {
        self.base = base
    }
}

protocol XXExtensionCompatible {
    associatedtype CompatibleXXExtensionType
    var xx: CompatibleXXExtensionType { get }
}

extension XXExtensionCompatible {
    public var xx: XXExtension<Self> {
        get { return XXExtension(self) }
    }
}


extension NSObject:XXExtensionCompatible{}

