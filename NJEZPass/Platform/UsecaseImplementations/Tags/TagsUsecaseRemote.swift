//
//  TagsUsecaseRemote.swift
//  Platform
//
//  Created by Gudavarthi, Pardhu on 08/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import Foundation
import Entities
import Domain

internal class TagsUsecaseRemote<T: Codable>: ITagsUsecase {
    
    var responseHandler: IResponseHandler
      init(handler: IResponseHandler) {
          self.responseHandler = handler
      }
    
    func getTagsList(request: TagsModel.Request) {
        
        let accessToken:String = PlatformUtility.serviceId ?? "sdfsfasfdasfas"
        
        var tagsRequest = request
        
        tagsRequest.serviceId = accessToken
        
        let requestAPI = APIRequest<TagsModel.Request>(method: .post, url: APIConstants.ServiceNames.tagsService, headers: [APIConstants.HTTPStrings.contentTypeHeader: APIConstants.HTTPStrings.contentTypeJSON, APIConstants.HTTPStrings.authorizationHeader: accessToken], params: tagsRequest, paramsEncoding: .json, multiPartImageDict: nil, mutliParamsDict: nil)
       
        APIService.shared.requestAPI(request: requestAPI, decodingType: T.self, completion: { response in
           switch response {
            case .onSuccess(let jsonData):
               self.responseHandler.onSuccess(response: jsonData)
            case .onFailure(let err):
               self.responseHandler.onError(err: err)
           }
        })
    }
    
    func searchTagwithNumber(request: SearchTagsModel.Request) {
        
        let accessToken:String = PlatformUtility.serviceId!
        let requestAPI = APIRequest<SearchTagsModel.Request>(method: .post, url: APIConstants.ServiceNames.tagsService, headers: [APIConstants.HTTPStrings.contentTypeHeader: APIConstants.HTTPStrings.contentTypeJSON, APIConstants.HTTPStrings.authorizationHeader: accessToken], params: nil, paramsEncoding: .json, multiPartImageDict: nil, mutliParamsDict: nil)
     
        APIService.shared.requestAPI(request: requestAPI, decodingType: T.self, completion: { response in
            switch response {
            case .onSuccess(let jsonData):
                self.responseHandler.onSuccess(response: jsonData)
            case .onFailure(let err):
                self.responseHandler.onError(err: err)
            }
        })
    }
}
