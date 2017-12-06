//
//  User.swift
//  Pods
//
//  Created by Rdxer on 2017/8/25.
//
//

import Foundation
import HandyJSON
import SwiftyUserDefaults


public struct User: HandyJSON{
    
    public var id:Int?
    
    public var name:String?
    public var email:String?
    
    public var updated_at:String?
    public var created_at:String?
    
    public init() {}
    
}


public extension DefaultsKeys {
    public static let User = DefaultsKey<User?>("DefaultsKeys.FastComponent._User")
}

public extension User{
    private static var _current:User?
    public static var current: User? {
        get {
            if _current == nil {
                if let model = Defaults.getModel(key: .User){
                    _current = model
                }
            }
            return _current
        }
        set {
            if let newValue = newValue {
                Defaults.setModel(key: .User, value: newValue)
            }else{
                Defaults.remove(.User)
            }
            _current = newValue
        }
    }
}


