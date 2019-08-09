//
//  LoginUsecaseAPI.swift
//  CMAA
//
//  Created by Latha, Sowjanya on 24/05/19.
//  Copyright © 2019 cnd. All rights reserved.
//

import Foundation
import Entities
import Domain

internal class LoginUsecaseRemote<T: Codable>: ILoginUsecase {
    var responseHandler: IResponseHandler
    init(handler: IResponseHandler) {
        self.responseHandler = handler
    }
    func login(request: LoginModel.Request) {
        
        let param = [
            "grant_type": "password",
            "client_id": "NJ_EZ_Pass",
            "client_secret":"N4pBHuCUgw8D2BdZtSMX2jexxw3tp7",
            "agencyID":"1",
            "loginType":"username",
            "value":request.userName!,
            "password":request.password!
            ] as [String : String]
        
        let requestAPI = APIRequest<LoginModel.Request>(method: .post, url: APIConstants.ServiceNames.loginUser, headers: [APIConstants.HTTPStrings.contentTypeHeader: APIConstants.HTTPStrings.contentTypeJSON], params: request, paramsEncoding: .json, multiPartImageDict: nil, mutliParamsDict: param)
        
//        APIService.shared.requestAPI(request: requestAPI, decodingType: T.self, completion: { response in
//            switch response {
//            case .onSuccess(let jsonData):
//                self.responseHandler.onSuccess(response: jsonData)
//            case .onFailure(let err):
//                self.responseHandler.onError(err: err)
//            }
//        })
        
        APIService.shared.requestMuliPartAPI(request: requestAPI, decodingType: T.self, completion: { response in
            switch response {
            case .onSuccess(let jsonData):
                self.responseHandler.onSuccess(response: jsonData)
            case .onFailure(let err):
                self.responseHandler.onError(err: err)
            }
        })
    }
}
