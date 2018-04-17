//
//  Device+Ex.swift
//  APP
//
//  Created by Rdxer on 2017/12/19.
//  Copyright © 2017年 Rdxer. All rights reserved.
//

import UIKit
import Device

public extension Device{
    /// iPhone*
    public static var deviceTypeShowString:String{
        return Device.version().rawValue
    }
}

public extension Bundle{
    
    ///    Bundle.main.infoDictionary["CFBundleShortVersionString"] >> "1.0"
    public var BundleShortVersionString:String{
        return (infoDictionary?["CFBundleShortVersionString"] as? String)  ?? ""
    }
    
    ///    Bundle.main.infoDictionary["CFBundleVersion"] >> "1"
    public var BundleVersion:String{
        return (infoDictionary?["CFBundleVersion"] as? String)  ?? ""
    }
    
    ///    Bundle.main.infoDictionary["CFBundleDisplayName"] >> "AppDisplayName"
    public var BundleDisplayName:String{
        return (infoDictionary?["CFBundleDisplayName"] as? String)  ?? ""
    }
}



