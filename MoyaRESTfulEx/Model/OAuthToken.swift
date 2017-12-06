//
//  OAuthToken.swift
//  XXSync
//
//  Created by Rdxer on 2017/8/10.
//  Copyright © 2017年 Rdxer. All rights reserved.
//

import Foundation
import HandyJSON
import SwiftyUserDefaults

public struct OAuthToken:HandyJSON {
    public var refresh_token:String?
    public var token_type:String?
    public var access_token:String?
    public var expires_in:Int?
    
    public init() {}
    
}

public extension DefaultsKeys {
    public static let OAuthToken = DefaultsKey<OAuthToken?>("DefaultsKeys.FastComponent._OAuthToken")
}

public extension OAuthToken{
    
    private static var _current:OAuthToken?
    public static var current: OAuthToken? {
        get {
            if _current == nil {
                if let model = Defaults.getModel(key: .OAuthToken){
                    _current = model
                }
            }
            return _current
        }
        set {
            if let newValue = newValue {
                Defaults.setModel(key: .OAuthToken, value: newValue)
            }else{
                Defaults.remove(.OAuthToken)
            }
            _current = newValue
            
        }
    }
}


