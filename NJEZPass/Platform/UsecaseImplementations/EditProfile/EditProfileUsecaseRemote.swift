//
//  EditProfileUsecaseRemote.swift
//  Platform
//
//  Created by Gudavarthi, Pardhu on 23/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import Foundation
import Entities
import Domain

internal class EditProfileUsecaseRemote<T: Codable>: IEditProfileUsecase {
    
    var responseHandler: IResponseHandler
    init(handler: IResponseHandler) {
        self.responseHandler = handler
    }
    
    func editProfile(request: EditProfileModel.Request) {
        
        let accessToken:String = PlatformUtility.serviceId!
        let requestAPI = APIRequest<EditProfileModel.Request>(method: .put, url: APIConstants.ServiceNames.profileUpdate, headers: [APIConstants.HTTPStrings.contentTypeHeader: APIConstants.HTTPStrings.contentTypeJSON, APIConstants.HTTPStrings.authorizationHeader: accessToken], params: nil, paramsEncoding: .json, multiPartImageDict: nil, mutliParamsDict: nil)
        
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
