//
//  TagsUsecaseProvider.swift
//  Platform
//
//  Created by Gudavarthi, Pardhu on 08/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import Foundation
import Entities
import Domain

open class TagsUsecaseProvider: ITagsUsecaseProvider {
    
    public init() {
    
    }
    
    public func provideTagsListUsecase(requestType: Constants.RequestCategory, handler: IResponseHandler) -> ITagsUsecase {
        
        switch requestType {
        case .remote:
            return TagsUsecaseRemote<TagsModel.Response>(handler: handler)
        }
    }
    
    public func provideSearchTagUsecase(requestType: Constants.RequestCategory, handler: IResponseHandler) -> ITagsUsecase {
        switch requestType {
        case .remote:
            return TagsUsecaseRemote<SearchTagsModel.Response>(handler: handler)
        }
    }
}
