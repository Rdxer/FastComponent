//
//  PluginManager.swift
//  XXSync
//
//  Created by Rdxer on 2017/8/10.
//  Copyright © 2017年 Rdxer. All rights reserved.
//

import Moya
import Result


public protocol OAuthTokenAuthorizable {
    var shouldOAuthTokenAuthorize: Bool { get }
}


public struct OAuthTokenPlugin: PluginType {
    
    public let authToken: OAuthToken
    
    private var authVal: String {
        return "Bearer " + authToken.access_token!
    }
    
    public init(authToken: OAuthToken) {
        self.authToken = authToken
    }
    
    public func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        
        if let authorizable = target as? OAuthTokenAuthorizable, authorizable.shouldOAuthTokenAuthorize == false {
            return request
        }
        
        var request = request
        
        request.addValue(authVal, forHTTPHeaderField: "Authorization")
        
        return request
    }
}

public class AcceptPlugin: PluginType {
    
    private let API_STANDARDS_TREE:String
    private let API_SUBTYPE:String
    private let API_VERSION:String
    private let API_DEFAULT_FORMAT:String
    
    private let acceptVal: String
    private let acceptVal_normal: String
    
    public init(
        API_VERSION:String,
        API_SUBTYPE:String,
        API_STANDARDS_TREE:String = "vnd",
        API_DEFAULT_FORMAT:String = "json"
        ) {
        
        self.API_STANDARDS_TREE = API_STANDARDS_TREE
        self.API_SUBTYPE = API_SUBTYPE
        self.API_VERSION = API_VERSION
        self.API_DEFAULT_FORMAT = API_DEFAULT_FORMAT
        
        acceptVal = "application/\(API_STANDARDS_TREE).\(API_SUBTYPE).\(API_VERSION)+\(API_DEFAULT_FORMAT)"
        acceptVal_normal = "application/\(API_DEFAULT_FORMAT)"
    }
    
    public func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        
        var request = request
        
        if let authorizable = target as? OAuthTokenAuthorizable {
            if authorizable.shouldOAuthTokenAuthorize {
                request.addValue(acceptVal, forHTTPHeaderField: "Accept")
            }else{
                request.addValue(acceptVal_normal, forHTTPHeaderField: "Accept")
            }
        }else{
            request.addValue(acceptVal_normal, forHTTPHeaderField: "Accept")
        }
        
        
        return request

    }
}

