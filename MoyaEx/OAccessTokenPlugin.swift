//
//  PluginManager.swift
//  App
//
//  Created by Rdxer on 2017/8/10.
//  Copyright © 2017年 Rdxer. All rights reserved.
//

import Moya
import Result


///  Moya 有  AccessTokenAuthorizable
open class OAccessTokenPlugin: PluginType {

    public let tokenClosure: (() -> String)

    public init(tokenClosure: @escaping(() -> String)) {
        self.tokenClosure = tokenClosure
    }
    public func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        guard let authorizable = target as? AccessTokenAuthorizable else { return request }
        
        let authorizationType = authorizable.authorizationType
        
        var request = request
        
        switch authorizationType {
        case .basic, .bearer:
            let authValue = authorizationType.rawValue + " " + tokenClosure()
            request.addValue(authValue, forHTTPHeaderField: "Authorization")
        case .none:
            break
        }
        
        return request
    }
    
    public func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
        guard case Result.failure(let error) = result else { return }//只监听失败
        
        print(error)
        
//        APPTipAlertViewController.init().do {
//            $0.message_Label.text = "\(String(describing: error.errorDescription ?? "no message"))"
//            $0.clickCancelButtonCallBack = { _ in
//                exit(0)
//            }
//            $0.clickConfirmButtonCallBack = {
//                $0.dismiss(animated: true, completion: nil)
//            }
//            $0.show()
//        }
    }
}



