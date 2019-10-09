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
    var nixieFlag: String?
    var suggestedAmount: String?
    var firstTimeLogin: String?
    var verificationToken: String?
    
    init(handler: IResponseHandler) {
        self.responseHandler = handler
    }
    func login(request: LoginModel.Request) {
        
        let requestAPI = APIRequest<LoginModel.Request>(method: .post, url: APIConstants.ServiceNames.loginUser, headers: [APIConstants.HTTPStrings.contentTypeHeader: APIConstants.HTTPStrings.contentTypeJSON], params: request, paramsEncoding: .json, multiPartImageDict: nil, mutliParamsDict: nil)
        

        APIService.shared.requestAPI(request: requestAPI, decodingType: T.self, completion: { response in
            switch response {
            case .onSuccess(let jsonData):
                
                guard let responseModel = jsonData as? LoginModel.Response else {
                    return
                }
                guard let accessId = responseModel.loginUser?.accessId else {
                    return
                }
                
                PlatformUtility.accessId = accessId
                self.nixieFlag = responseModel.loginUser?.nixieFlag
                self.suggestedAmount = responseModel.loginUser?.suggestedAmount
                self.firstTimeLogin = responseModel.loginUser?.firstTimeLogin
                
                let token: String = APIConstants.DefaultParams.vendorID + "|" + accessId + "|" + APIConstants.DefaultParams.token
                
                self.verificationToken = token.sha256().lowercased()
                
                let request = AuthorizeModel.Request(action: APIConstants.ServiceNames.authorizeUser, vendorId: APIConstants.DefaultParams.vendorID, verificationToken: self.verificationToken!, accessId: accessId)
                
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
                var responseModel = jsonData
                responseModel.suggestedAmount = self.suggestedAmount
                responseModel.nixieFlag = self.nixieFlag
                responseModel.firstTimeLogin = self.firstTimeLogin

                self.responseHandler.onSuccess(response: responseModel)
            case .onFailure(let err):
                self.responseHandler.onError(err: err)
            }
        })
    }
    
    func registerPushService(request: PushModel.Request) {
        
        var pushRequest = request
        
        let token: String = APIConstants.DefaultParams.vendorID + "|" +         PlatformUtility.getaccessId()!  + "|" + APIConstants.DefaultParams.token
                       
        let verificationToken:String = token.sha256().lowercased()
        
        pushRequest.deviceToken = verificationToken
           
        let pushAPI = APIRequest<PushModel.Request>(method: .post, url: APIConstants.ServiceNames.pushService, headers: [APIConstants.HTTPStrings.contentTypeHeader: APIConstants.HTTPStrings.contentTypeJSON], params: pushRequest, paramsEncoding: .json, multiPartImageDict: nil, mutliParamsDict: nil)
               
       APIService.shared.requestAPI(request: pushAPI, decodingType: PushModel.Response.self, completion: { response in
           switch response {
           case .onSuccess(let jsonData):
               self.responseHandler.onSuccess(response: jsonData)
           case .onFailure(let err):
               self.responseHandler.onError(err: err)
           }
       })
        
    }
    
    func loadDynamicData(request: DynamicCacheModel.Request) {
        
        let requestAPI = APIRequest<DynamicCacheModel.Request>(method: .post, url: APIConstants.ServiceNames.loadDynamicCache, headers: [APIConstants.HTTPStrings.contentTypeHeader: APIConstants.HTTPStrings.contentTypeJSON], params: request, paramsEncoding: .json, multiPartImageDict: nil, mutliParamsDict: nil)
        
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
