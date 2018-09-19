//
//  Device+Ex.swift
//  APP
//
//  Created by Rdxer on 2017/12/19.
//  Copyright © 2017年 Rdxer. All rights reserved.
//

import Foundation
import UIKit
import SAMKeychain
import FastComponent

fileprivate let xx_UniqueDeviceIdentifier_Key = "xx_UniqueDeviceIdentifier"
public extension XXExtension where Base:Bundle{
    
    public var uniqueDeviceIdentifier:String?{
        guard let serviceName = base.bundleIdentifier else{
            return nil
        }
        
        if  let udid = SAMKeychain.password(forService: serviceName, account: xx_UniqueDeviceIdentifier_Key)?.nilOrNotEmptyString{
            return udid
        }
        
        let uuid = UIDevice.current.identifierForVendor?.uuidString
        let query = SAMKeychainQuery.init()
        query.service = serviceName
        query.account = xx_UniqueDeviceIdentifier_Key
        query.password = uuid
        query.synchronizationMode = .no
        
        do {
            try query.save()
        } catch  {
            XXLoger.e("try query.save()")
            return nil
        }
        
        return uuid
    }
}
