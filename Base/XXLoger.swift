//
//  XXLoger.swift
//  App
//
//  Created by LXF on 2018/7/16.
//  Copyright © 2018年 LXF. All rights reserved.
//

import UIKit


/// 日志级别
///
/// - D: 一般的调试信息
/// - W: 警告级别的
/// - E: 错误级别的
public enum XXLogerTagLevel:Int{
    case d = 1
    case w = 10
    case e = 100
    case MAX = 99999
}

extension XXLogerTagLevel:CustomStringConvertible{
    public var description : String {
        switch self{
        case .d: return "😀"
        case .w: return "⚠️"
        case .e: return "❌"
        case .MAX:
            return "💣"
        }
    }
}

open class XXLoger {
    
    open static var defaultLoger = XXLoger.init()
    
    /// 默认 log 级别 = LogTagLevel.d
    open var defaultLogLevel = XXLogerTagLevel.d
    
    public init() {
        
    }
    
    /// 打印一般打印信息
    open func d<T>(_ message: T,
                          level: XXLogerTagLevel = .d,
                          file: String = #file,
                          method: String = #function,
                          line: Int = #line)
    {
        log(message, level:level,
               file: file,
               method: method,
               line: line)
        
    }
    
    /// 打印警告信息
    open func w<T>(_ message: T,
                          level: XXLogerTagLevel = .w,
                          file: String = #file,
                          method: String = #function,
                          line: Int = #line)
    {
        log(message, level:level,
               file: file,
               method: method,
               line: line)
    }
    /// 打印错误信息
    open func e<T>(_ message: T,
                          level: XXLogerTagLevel = .e,
                          file: String = #file,
                          method: String = #function,
                          line: Int = #line)
    {
        log(message, level:level,
               file: file,
               method: method,
               line: line)
    }
    
    /// 输出日志-TAG
    ///
    /// - parameter message: 日志消息
    /// - parameter level:   日志级别,默认是 D(debug)
    /// - parameter file:    文件路径
    /// - parameter method:  方法名
    /// - parameter line:    代码行数
    open func log<T>(_ message: T,
                           level: XXLogerTagLevel = .d,
                           file: String ,
                           method: String ,
                           line: Int)
    {
        
        if level.rawValue < defaultLogLevel.rawValue{
            return
        }
        
        let fileName = NSURL(fileURLWithPath: file).deletingPathExtension!.lastPathComponent
        
        // MARK: -  format 格式字符串,
        print(String(format: "%@ %@(%d) %@ 💬: %@", "\(level.description)", fileName, line, method ,"\(message)"))
    }
}


extension XXLoger{
    /// 打印一般打印信息
    public static func d<T>(_ message: T,
                     level: XXLogerTagLevel = .d,
                     file: String = #file,
                     method: String = #function,
                     line: Int = #line)
    {
        
        defaultLoger.log(message, level: level, file: file, method: method, line: line)
    }
    
    /// 打印警告信息
    public static func w<T>(_ message: T,
                     level: XXLogerTagLevel = .w,
                     file: String = #file,
                     method: String = #function,
                     line: Int = #line)
    {
        defaultLoger.log(message, level: level, file: file, method: method, line: line)
    }
    /// 打印错误信息
    public static func e<T>(_ message: T,
                     level: XXLogerTagLevel = .e,
                     file: String = #file,
                     method: String = #function,
                     line: Int = #line)
    {
        defaultLoger.log(message, level: level, file: file, method: method, line: line)
    }
}
