//
//  TargetTypeEx.swift
//  XXSync
//
//  Created by Rdxer on 2017/8/10.
//  Copyright © 2017年 Rdxer. All rights reserved.
//

import Foundation
import Moya


public enum ResourcesType {
    
    /// 浏览
    case index
    
    /// 创建 资源
    case store
    
    /// 显示指定资源
    case show(id:String)
    
    /// 更新指定资源
    case update(id:String)
    
    /// 删除指定资源
    case destroy(id:String)
    
}


// TargetType
public protocol ResourcesTargetType:TargetType {
    var methodMap:ResourcesType { get }
    var resourcesTargetPath:String { get }
}

public extension ResourcesTargetType{
    
    open var path: String {
        switch methodMap {
        case .index , .store:
            return resourcesTargetPath
        case .show(let id) , .update(let id)  , .destroy(let id):
            return resourcesTargetPath + "/" + id
        }
    }
    
    /// The HTTP method used in the request.
    open var method: Moya.Method {
        switch methodMap {
        case .index ,.show(_):
            return .get
        case .store:
            return .post
        case  .update(_):
            return .put
        case .destroy(_):
            return .delete
        }
    }
    
    /// The method used for parameter encoding.
    open var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    /// Provides stub data for use in testing.
    open var sampleData: Data {
        return "".data(using: .utf8)!
    }
    
    /// The type of HTTP task to be performed.
    open var task: Task {
        return Task.requestPlain
    }
}
