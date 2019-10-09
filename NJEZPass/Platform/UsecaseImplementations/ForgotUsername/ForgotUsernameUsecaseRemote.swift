//
//  ForgotUsernameUsecaseRemote.swift
//  Platform
//
//  Created by Gudavarthi, Pardhu on 09/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import Foundation
import Entities
import Domain

internal class ForgotUsernameUsecaseRemote<T: Codable>: IForgotUsernameUsecase {
   
    var responseHandler: IResponseHandler
        init(handler: IResponseHandler) {
            self.responseHandler = handler
        }
    
    func forgotUsername(request: ForgotUsernameModel.Request) {
           
        let requestAPI = APIRequest<ForgotUsernameModel.Request>(method: .post, url: APIConstants.ServiceNames.forgotUsername, headers: [APIConstants.HTTPStrings.contentTypeHeader: APIConstants.HTTPStrings.contentTypeJSON], params: request, paramsEncoding: .json, multiPartImageDict: nil, mutliParamsDict: nil)
       
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
