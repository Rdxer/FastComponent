//
//  IndexContainer.swift
//  XXSync
//
//  Created by Rdxer on 2017/8/10.
//  Copyright © 2017年 Rdxer. All rights reserved.
//

import Foundation
import HandyJSON


public struct IndexContainer<T>:HandyJSON{
    
    var prev_page_url:String?
    var from:Int?
    var total:Int?
    var last_page:Int?
    var per_page:Int?
    var to:Int?
    var next_page_url:Any?
    var current_page:Int?
    var data:[T]?
    
    public init() {}
}
