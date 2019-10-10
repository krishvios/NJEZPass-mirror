//
//  ResetPasswordInteractor.swift
//  NJEZPass
//
//  Created by Gudavarthi, Pardhu on 08/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
import Entities
import Domain
import Platform

protocol IResetPasswordInteractable {
    func sendEmailLinkToResetPassword(request:ResetPasswordModel.Request, requestType: Constants.RequestCategory)
}

class ResetPasswordInteractor {
    var presenter: IResponseHandler?
    var forgotPasswordUsecaseProvider = ForgotPasswordUsecaseProvider()
}

extension ResetPasswordInteractor: IResetPasswordInteractable {
    
    func sendEmailLinkToResetPassword(request: ResetPasswordModel.Request, requestType: Constants.RequestCategory) {
        
        if let responseHandler = presenter {
            let interfaceObj = forgotPasswordUsecaseProvider.sendEmailLinkForResetPasswordUsecase(requestType: requestType, handler: responseHandler)
            interfaceObj.sendEmailLinkToResetPassword(request: request)
        }
    }
}
