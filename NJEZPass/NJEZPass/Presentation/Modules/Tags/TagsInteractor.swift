//
//  TagsInteractor.swift
//  NJEZPass
//
//  Created by Gudavarthi, Pardhu on 08/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
import Entities
import Domain
import Platform

protocol ITagsInteractable {
    func getTagsList(action:String, requestType: Constants.RequestCategory)
    func searchTagwithNumber(action: String, tagNo: String, requestType: Constants.RequestCategory)
}

class TagsInteractor {
    var presenter: IResponseHandler?
    var tagsUsecaseProvider = TagsUsecaseProvider()
}

extension TagsInteractor: ITagsInteractable {
    func getTagsList(action: String, requestType: Constants.RequestCategory) {
        
        let tagsRequest = TagsModel.Request(action: action, serviceId: "", startIndex: "1", count: "10")
        
        if let responseHandler = presenter {
            let interfaceObj = tagsUsecaseProvider.provideTagsListUsecase(requestType: requestType, handler: responseHandler)
            interfaceObj.getTagsList(request: tagsRequest)
        }
    }
    
    func searchTagwithNumber(action: String, tagNo: String, requestType: Constants.RequestCategory) {
        
        let request = SearchTagsModel.Request()
        if let responseHandler = presenter {
        let interfaceObj = tagsUsecaseProvider.provideSearchTagUsecase(requestType: requestType, handler: responseHandler)
            interfaceObj.searchTagwithNumber(request: request)
                        
        }
    }
}
