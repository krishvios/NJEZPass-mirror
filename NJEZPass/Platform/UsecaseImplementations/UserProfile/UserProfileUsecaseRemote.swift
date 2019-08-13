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
    func getProfileOverview(accessToken: String) {
        
        let requestAPI = APIRequest<ProfileModel.Request>(method: .get, url: APIConstants.ServiceNames.profileOverview, headers: [APIConstants.HTTPStrings.contentTypeHeader: APIConstants.HTTPStrings.contentTypeJSON, APIConstants.HTTPStrings.authorizationHeader: accessToken], params: nil, paramsEncoding: .json, multiPartImageDict: nil, mutliParamsDict: nil)
        
                APIService.shared.requestAPI(request: requestAPI, decodingType: T.self, completion: { response in
                    switch response {
                    case .onSuccess(let jsonData):
                        self.responseHandler.onSuccess(response: jsonData)
                    case .onFailure(let err):
                        self.responseHandler.onError(err: err)
                    }
                })
        
//        APIService.shared.requestMuliPartAPI(request: requestAPI, decodingType: T.self, completion: { response in
//            switch response {
//            case .onSuccess(let jsonData):
//                self.responseHandler.onSuccess(response: jsonData)
//            case .onFailure(let err):
//                self.responseHandler.onError(err: err)
//            }
//        })
    }
}
