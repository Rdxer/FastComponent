//
//  BaseButtonRow.swift
//  _
//
//  Created by _ on 6/23/16.
//  Copyright © 2016 _. All rights reserved.
//

import Foundation
import Eureka

public final class _BaseButtonRow<T: Equatable> : _ButtonRowOf<T>, RowType {

    var textColor:UIColor?
    
    public required init(tag: String?) {
        super.init(tag: tag)
    }

    public override func updateCell() {
        super.updateCell()
        let leftAligmnment = presentationMode != nil
        if (!leftAligmnment){
            if textColor == nil {
                cell.textLabel?.textColor = UIApplication.shared.keyWindow?.tintColor
            }else{
                cell.textLabel?.textColor = textColor
            }
        }
    }

}

public typealias BaseButtonRow = _BaseButtonRow<String>
