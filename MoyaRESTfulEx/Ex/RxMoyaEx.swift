//
//  map.swift
//  XXSync
//
//  Created by Rdxer on 2017/8/10.
//  Copyright © 2017年 Rdxer. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import HandyJSON



extension ObservableType where E == Response {
    /// 整块
    public func mapModel<T: HandyJSON>(_ type: T.Type) -> Observable<T> {
        return flatMap { response -> Observable<T> in
            return Observable.just(response.mapModel(T.self))
        }
    }
}

extension Response {
    func mapModel<T: HandyJSON>(_ type: T.Type) -> T {
        let jsonString = String.init(data: data, encoding: .utf8)
        
        return JSONDeserializer<T>.deserializeFrom(json: jsonString)!
    }
}


// single
extension ObservableType where E == Response {
    /// 第一个字典value中取
    public func mapSingleModel<T: HandyJSON>(_ type: T.Type) -> Observable<T?> {
        return flatMap { response -> Observable<T?> in
            return Observable.just(response.mapSingleModel(T.self))
        }
    }
}

extension Response {
    func mapSingleModel<T: HandyJSON>(_ type: T.Type) -> T? {
        let jsonObject = try? JSONSerialization.jsonObject(with:data, options: .allowFragments)
        let jsonDict = jsonObject as? [String:NSDictionary]
        let value = jsonDict?.first?.value
        return JSONDeserializer<T>.deserializeFrom(dict: value)
        
    }
}


// list
extension ObservableType where E == Response {
    /// 从 "data" 字段中取
    public func mapModelList<T: HandyJSON>(_ type: T.Type) -> Observable<[T?]?> {
        return flatMap { response -> Observable<[T?]?> in
            return Observable.just(response.mapModelList(T.self))
        }
    }
}

extension Response {
    func mapModelList<T: HandyJSON>(_ type: T.Type) -> [T?]? {
        let jsonObject = try? JSONSerialization.jsonObject(with:data, options: .allowFragments)
        let jsonDict = jsonObject as? [String:Any]
        guard let data = jsonDict?["data"] as? NSArray else{
            return nil
        }
        return JSONDeserializer<T>.deserializeModelArrayFrom(array: data)
    }
}





