//
//  ForgotUsernameInteractor.swift
//  NJEZPass
//
//  Created by Gudavarthi, Pardhu on 08/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
import Entities
import Domain
import Platform

protocol IForgotUsernameInteractable {
    func forgotUsername(request:ForgotUsernameModel.Request, requestType: Constants.RequestCategory)
}

class ForgotUsernameInteractor {
    var presenter: IResponseHandler?
    var forgotUsernameUsecaseProvider = ForgotUsernameUsecaseProvider()
}

extension ForgotUsernameInteractor: IForgotUsernameInteractable {
    func forgotUsername(request:ForgotUsernameModel.Request, requestType: Constants.RequestCategory) {
                        
        if let responseHandler = presenter {
            let interfaceObj = forgotUsernameUsecaseProvider.provideForgotUsernameUsecase(requestType: requestType, handler: responseHandler)
              interfaceObj.forgotUsername(request: request)
          }
    }
}
