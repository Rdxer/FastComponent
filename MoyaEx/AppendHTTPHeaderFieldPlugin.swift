//
//  Mater.swift
//  XXQrcode
//
//  Created by Rdxer on 2017/6/6.
//  Copyright © 2017年 Rdxer. All rights reserved.
//
import Moya

public protocol AppendHTTPHeaderFieldProtocol {
    var append: Bool { get }
}

extension AppendHTTPHeaderFieldProtocol{
    public var append: Bool {
        get{
            return true
        }
        
    }
}


/// 拼接请求头
open class AppendHTTPHeaderFieldPlugin: PluginType {
    
    open  var HTTPHeaderFields:[String:String]
    
    public  init(
        HTTPHeaderFields:[String:String]
        ) {
        self.HTTPHeaderFields = HTTPHeaderFields
    }
    
    open  func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        
        /// 默认添加  遵守协议并且 返回 false 才不拼接
        if let t = target as? AppendHTTPHeaderFieldProtocol,t.append
            == false  {
            return request
        }
        
        var request = request
        
        for kv in HTTPHeaderFields {
            request.addValue(kv.value, forHTTPHeaderField: kv.value)
        }
        
        return request
        
    }
}
