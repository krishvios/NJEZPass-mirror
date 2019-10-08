//
//  ITagsUsecaseProvider.swift
//  Domain
//
//  Created by Gudavarthi, Pardhu on 05/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import Foundation

public protocol ITagsUsecaseProvider {
    
    func provideTagsListUsecase(requestType: Constants.RequestCategory, handler: IResponseHandler) -> ITagsUsecase
    func provideSearchTagUsecase(requestType: Constants.RequestCategory, handler: IResponseHandler) -> ITagsUsecase
}
