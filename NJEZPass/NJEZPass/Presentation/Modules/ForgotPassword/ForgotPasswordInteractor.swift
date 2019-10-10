//
//  ForgotPasswordInteractor.swift
//  NJEZPass
//
//  Created by Gudavarthi, Pardhu on 08/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
import Entities
import Domain
import Platform

protocol IForgotPasswordInteractable {
    func forgotPassword(request:ForgotPasswordModel.Request, requestType: Constants.RequestCategory)
}

class ForgotPasswordInteractor {
    var presenter: IResponseHandler?
    var forgotPasswordUsecaseProvider = ForgotPasswordUsecaseProvider()
}

extension ForgotPasswordInteractor: IForgotPasswordInteractable {
    func forgotPassword(request:ForgotPasswordModel.Request, requestType: Constants.RequestCategory) {
                       
               if let responseHandler = presenter {
                let interfaceObj = forgotPasswordUsecaseProvider.provideForgotPasswordUsecase(requestType: requestType, handler: responseHandler)
                   interfaceObj.forgotPassword(request: request)
               }
    }
}
