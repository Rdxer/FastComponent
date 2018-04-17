//
//  Collection+Ex.swift
//  APP
//
//  Created by Rdxer on 2017/12/29.
//  Copyright © 2017年 Rdxer. All rights reserved.
//

import Foundation
import XXLogger


extension Array{
    /// 转成 Json
    public var toJsonString:String?{
        
        do {
            let res = try JSONSerialization.data(withJSONObject: self, options: [])
            return String.init(data: res, encoding: .utf8)
        } catch {
            printE("toJsonString 失败 >>\(self) >> \(error)")
            return nil
        }
    }
    /// 随机
    public var randomElement:Element?{
        
        if count == 0 {
            return nil
        }
        
        if count == 1 {
            return self.first
        }
        
        let randomIndex = Int(arc4random_uniform(UInt32(count)))
        
        return self[randomIndex]
    }
    
    /// 安全的取数组的 元素
    public func safe(index:Int)->Element?{
        
        if index < 0 || index >= count {
            return nil
        }
        
        return self[index]
    }

    /// 安全的取数组范围的 元素 [fromIndex,toIndex)
    public func safe_List(from fromIndex:Int = -1,to toIndex:Int = Int.max)->[Element]{
        
        if count == 0 {
            return []
        }
        
        var resList:[Element] = []
        
        for index in 0..<self.count {
            if (index > fromIndex && index < toIndex) || index == fromIndex{
                resList.append(self[index])
            }
        }
        
        return resList
    }
    
    /// 数组 为  empty 返回 nil  否则返回数组
    public var nilOrNotEmpty:[Element]?{
        return isEmpty ? nil : self
    }
    /// 带  index 的 forEach
    public func forEach(_ body: (Int,Element) -> Void){
        for index in 0..<self.count {
            body(index,self[index])
        }
    }
    
}

//extension Array where Element:AnyObject {
//    /// 过滤 数组中 nil 元素
//    public func filterNil_safe() -> [Element] {
//        return filter({ (item) -> Bool in
//            return item != nil
//        })
//    }
//}

extension Array{
    
    /// 只能用于 AnyObject  调用 isEqual
    public func index_xx(of element: Element) -> Int?{
        for (index,item) in self.enumerated() {
            let itemObject = item as AnyObject
            if itemObject.isEqual(element){
                return index
            }
        }
        return nil
    }

    /// 安全删除
    public mutating func remove_safe(at element:Element) -> Int? {
        if let index = index_xx(of: element) {
            _ = remove(at: index)
            return index
        }
        return nil
    }
}

