//
//  ForgotPasswordUsecaseRemote.swift
//  Platform
//
//  Created by Gudavarthi, Pardhu on 09/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import Foundation
import Entities
import Domain

internal class ForgotPasswordUsecaseRemote<T: Codable>: IForgotPasswordUsecase {
    
    var responseHandler: IResponseHandler
        init(handler: IResponseHandler) {
            self.responseHandler = handler
        }
    
    func sendEmailLinkToResetPassword(request: ResetPasswordModel.Request) {
        
        let requestAPI = APIRequest<ResetPasswordModel.Request>(method: .post, url: APIConstants.ServiceNames.forgotPassword, headers: [APIConstants.HTTPStrings.contentTypeHeader: APIConstants.HTTPStrings.contentTypeJSON], params: request, paramsEncoding: .json, multiPartImageDict: nil, mutliParamsDict: nil)
        
         APIService.shared.requestAPI(request: requestAPI, decodingType: T.self, completion: { response in
            switch response {
             case .onSuccess(let jsonData):
                self.responseHandler.onSuccess(response: jsonData)
             case .onFailure(let err):
                self.responseHandler.onError(err: err)
            }
         })
    }
    
    func answerSecurityQuestionsToResetPassword(request: ResetPasswordModel.Request) {
        
        let requestAPI = APIRequest<ResetPasswordModel.Request>(method: .post, url: APIConstants.ServiceNames.forgotPassword, headers: [APIConstants.HTTPStrings.contentTypeHeader: APIConstants.HTTPStrings.contentTypeJSON], params: request, paramsEncoding: .json, multiPartImageDict: nil, mutliParamsDict: nil)
        
         APIService.shared.requestAPI(request: requestAPI, decodingType: T.self, completion: { response in
            switch response {
             case .onSuccess(let jsonData):
                self.responseHandler.onSuccess(response: jsonData)
             case .onFailure(let err):
                self.responseHandler.onError(err: err)
            }
         })
    }

    
    func forgotPassword(request: ForgotPasswordModel.Request) {
        
                     let requestAPI = APIRequest<ForgotPasswordModel.Request>(method: .post, url: APIConstants.ServiceNames.forgotPassword, headers: [APIConstants.HTTPStrings.contentTypeHeader: APIConstants.HTTPStrings.contentTypeJSON], params: request, paramsEncoding: .json, multiPartImageDict: nil, mutliParamsDict: nil)
                    
                     APIService.shared.requestAPI(request: requestAPI, decodingType: T.self, completion: { response in
                        switch response {
                         case .onSuccess(let jsonData):
                            self.responseHandler.onSuccess(response: jsonData)
                         case .onFailure(let err):
                            self.responseHandler.onError(err: err)
                        }
                     })
        
       }
    
    func setNewPassword(request: ResetPasswordModel.Request) {
        
        let requestAPI = APIRequest<ResetPasswordModel.Request>(method: .post, url: APIConstants.ServiceNames.forgotPassword, headers: [APIConstants.HTTPStrings.contentTypeHeader: APIConstants.HTTPStrings.contentTypeJSON], params: request, paramsEncoding: .json, multiPartImageDict: nil, mutliParamsDict: nil)
               
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
