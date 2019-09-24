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
        
        let requestAPI = APIRequest<LoginModel.Request>(method: .post, url: APIConstants.ServiceNames.loginUser, headers: [APIConstants.HTTPStrings.contentTypeHeader: APIConstants.HTTPStrings.contentTypeJSON], params: request, paramsEncoding: .json, multiPartImageDict: nil, mutliParamsDict: nil)
        
        APIService.shared.requestAPI(request: requestAPI, decodingType: T.self, completion: { response in
            switch response {
            case .onSuccess(let jsonData):
                
                let responseModel = jsonData as? LoginModel.Response
                let accessId = responseModel?.loginUser!.accessId
                let token: String = APIConstants.DefaultParams.vendorID + "|" + accessId! + "|" + APIConstants.DefaultParams.token
                
                let verificationToken: String = token.sha256().lowercased()
                
                let request = AuthorizeModel.Request(action: APIConstants.ServiceNames.authorizeUser, vendorId: APIConstants.DefaultParams.vendorID, verificationToken: verificationToken, accessId: accessId!)
                
                self.authorizeUser(request:request)
                
            case .onFailure(let err):
                self.responseHandler.onError(err: err)
            }
        })
        
    }
    
    func authorizeUser(request: AuthorizeModel.Request) {
        
        let authorizeAPI = APIRequest<AuthorizeModel.Request>(method: .post, url: APIConstants.ServiceNames.authorizeUser, headers: [APIConstants.HTTPStrings.contentTypeHeader: APIConstants.HTTPStrings.contentTypeJSON], params: request, paramsEncoding: .json, multiPartImageDict: nil, mutliParamsDict: nil)
        
        APIService.shared.requestAPI(request: authorizeAPI, decodingType: AuthorizeModel.Response.self, completion: { response in
            switch response {
            case .onSuccess(let jsonData):
                PlatformUtility.serviceId = jsonData.authorizeUser?.serviceId
                self.responseHandler.onSuccess(response: jsonData)
            case .onFailure(let err):
                self.responseHandler.onError(err: err)
            }
        })
    }

}
