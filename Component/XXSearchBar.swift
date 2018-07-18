//
//  XXSearchBar.swift
//  APP
//
//  Created by Rdxer on 2017/12/10.
//  Copyright © 2017年 Rdxer. All rights reserved.
//

import UIKit

/// iOS11 图标/占位符 居中的SearchBar
open class XXSearchBar: UISearchBar {
    
    /// 如果是自动布局 需要先调用 `layoutIfNeeded()`
    /// 配置
    open func iOS11_configuration_ifneed(){
        
        if #available(iOS 11, *) {
           
        }else{
            XXLoger.w("XXSearchBar - 非 iOS 11 使用默认效果")
            return
        }
        
        XXLoger.w("XXSearchBar - iOS11_configuration")
        
        self.textFieldList
            .forEach { (textField) in
                if self.text?.length == 0 {
                    let offset = UIOffset.init(horizontal: ((textField.frame.width - placeholderWidth) * 0.5), vertical: 0)
                    self.setPositionAdjustment(offset, for: .search)
                }
        }
    }
    
    open var textFieldList:[UITextField]{
        return self.subviews
            .map({$0.subviews})
            .reduce([], +)
            .filter({ $0.isKind(of: UITextField.self) })
            .map({ $0 as! UITextField })
    }
    
    // MARK: -
    // MARK: - 计算占用宽度
    
    static let placeHolderFont:CGFloat = 15.0
    static let iconSpacing:CGFloat = 10.0
    static let searchIconW:CGFloat = 20.0
    
    fileprivate var _placeholderWidth:CGFloat?
    open var placeholderWidth:CGFloat{
        get{
            if self._placeholderWidth == nil {
                let str = (self.placeholder ?? "") as NSString
                let rect = str.boundingRect(with: CGSize.init(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude), options: [.usesLineFragmentOrigin,.usesFontLeading], attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: XXSearchBar.placeHolderFont)], context: nil)
                self._placeholderWidth =  rect.width + XXSearchBar.iconSpacing + XXSearchBar.searchIconW
            }
            return self._placeholderWidth ?? 0
        }
    }
}
// MARK: - 动画
extension XXSearchBar:UITextFieldDelegate{
    open func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        XXLoger.w("XXSearchBar - textFieldShouldBeginEditing")
        let res = self.delegate?.searchBarShouldBeginEditing?(self) ?? true
        
        if res,text?.length == 0{
            if #available(iOS 11, *) {
                let offset = UIOffset.zero
                UIView.animate(withDuration: 0.3, animations: {
                    self.setPositionAdjustment(offset, for: .search)
                })
            }
        }
        
        return res
    }
    open func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        XXLoger.w("XXSearchBar - textFieldShouldEndEditing")
        let res = self.delegate?.searchBarShouldBeginEditing?(self) ?? true
        
        if res,text?.length == 0{
            if #available(iOS 11, *) {
                let offset = UIOffset.init(horizontal: ((textField.frame.width - placeholderWidth) * 0.5), vertical: 0)
                UIView.animate(withDuration: 0.3, animations: {
                    self.setPositionAdjustment(offset, for: .search)
                })
            }
        }
        
        return res
    }
}

extension String {
    fileprivate var length: Int { return self.characters.count }
}

