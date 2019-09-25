//
//  UserProfileUsecaseRemote.swift
//  Platform
//
//  Created by Gudavarthi, Pardhu on 09/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import Foundation
import Entities
import Domain

internal class UserProfileUsecaseRemote<T: Codable>: IUserProfileUsecase {
    
    var responseHandler: IResponseHandler
    init(handler: IResponseHandler) {
        self.responseHandler = handler
    }
    func getProfileOverview(action: String) {
        
        let request = ProfileModel.Request(action: action, serviceId: PlatformUtility.getserviceId()!)
        
        let requestAPI = APIRequest<ProfileModel.Request>(method: .post, url: APIConstants.ServiceNames.accountOverview, headers: [APIConstants.HTTPStrings.contentTypeHeader: APIConstants.HTTPStrings.contentTypeJSON], params: request, paramsEncoding: .json, multiPartImageDict: nil, mutliParamsDict: nil)
        
        APIService.shared.requestAPI(request: requestAPI, decodingType: T.self, completion: { response in
            switch response {
            case .onSuccess(let jsonData):
                self.responseHandler.onSuccess(response: jsonData)
            case .onFailure(let err):
                self.responseHandler.onError(err: err)
            }
        })
    }
    
    func updateAddress(request: UpdateAddressModel.Request) {
        
        let requestAPI = APIRequest<UpdateAddressModel.Request>(method: .post, url: APIConstants.ServiceNames.updateAddress, headers: [APIConstants.HTTPStrings.contentTypeHeader: APIConstants.HTTPStrings.contentTypeJSON], params: request, paramsEncoding: .json, multiPartImageDict: nil, mutliParamsDict: nil)
        
        APIService.shared.requestAPI(request: requestAPI, decodingType: T.self, completion: { response in
            switch response {
            case .onSuccess(let jsonData):
                self.responseHandler.onSuccess(response: jsonData)
            case .onFailure(let err):
                self.responseHandler.onError(err: err)
            }
        })
    }
    
    func updateSecurityQuestions(request: SecurityQuestionsModel.Request) {
                
        let requestAPI = APIRequest<SecurityQuestionsModel.Request>(method: .post, url: APIConstants.ServiceNames.updateSecurityQuestions, headers: [APIConstants.HTTPStrings.contentTypeHeader: APIConstants.HTTPStrings.contentTypeJSON], params: request, paramsEncoding: .json, multiPartImageDict: nil, mutliParamsDict: nil)
        
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
