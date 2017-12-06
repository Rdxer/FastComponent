//
//  RestfulOAuth.swift
//  XXSync
//
//  Created by Rdxer on 2017/8/10.
//  Copyright © 2017年 Rdxer. All rights reserved.
//

import Foundation
import Moya


public var baseURLString = ""

public enum RestfulOAuthApi {
    case oauth(
        userName:String,
        password:String,
        client_id:String,
        client_secret:String
    )
}

extension RestfulOAuthApi:TargetType{
    
    public var baseURL: URL {
        return URL.init(string: baseURLString)!
    }
    
    public var path: String {
        switch self {
        case .oauth(userName: _, password: _, client_id: _, client_secret: _):
            return "oauth/token"
        default: return ""
        }
    }
    
    /// The HTTP method used in the request.
    /// 请求中使用的HTTP方法。
    public var method: Moya.Method {
        switch self {
        case .oauth(userName: _, password: _, client_id: _, client_secret: _):
            return .post
        default:
            return .get
        }
    }
    
    public var parameters: [String: Any]? {
        switch self {
        case .oauth(let userName,let password,let  client_id,let client_secret):
            return [
                "grant_type":"password",
                "client_id":client_id,
                "client_secret":client_secret,
                "username":userName.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines),
                "password":password.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
            ]
        default:
            return nil
        }
    }
    
    /// 方法用于参数编码。
    public var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    /// 提供存根数据用于测试。
    public var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    /// 执行HTTP任务的类型。
    public var task: Task {
        return .request
    }
    
}
