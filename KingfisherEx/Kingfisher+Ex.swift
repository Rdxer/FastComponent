//
//  KF+Ex.swift
//  APP
//
//  Created by LXF on 2018/1/4.
//  Copyright © 2018年 Rdxer. All rights reserved.
//

import Foundation
import Kingfisher
// MARK: - Extension methods.
/**
 *    Set image to use from web.
 */
extension Kingfisher where Base: ImageView {
    @discardableResult
    
    /// 使用当前图像作为占位符 Use the current image as a placeholder
    /// 如果 placeholder 为 nil
    public func setImageWithCurrentImage(with resource: Resource?,
                         placeholder: Placeholder? = nil,
                         options: KingfisherOptionsInfo? = nil,
                         progressBlock: DownloadProgressBlock? = nil,
                         completionHandler: CompletionHandler? = nil) -> RetrieveImageTask
    {
        var placeholder =  placeholder
        if placeholder == nil {
            placeholder = self.base.image
        }
        
        return setImage(with: resource, placeholder: placeholder, options: options, progressBlock: progressBlock, completionHandler: completionHandler)
    }
    
}
