//
//  NewPasswordInteractor.swift
//  NJEZPass
//
//  Created by Gudavarthi, Pardhu on 08/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
import Entities
import Domain
import Platform

protocol INewPasswordInteractable {
    func setNewPassword(request:ResetPasswordModel.Request, requestType: Constants.RequestCategory)
}

class NewPasswordInteractor {
    var presenter: IResponseHandler?
    var forgotPasswordUsecaseProvider = ForgotPasswordUsecaseProvider()
}

extension NewPasswordInteractor: INewPasswordInteractable {
    
    func setNewPassword(request:ResetPasswordModel.Request, requestType: Constants.RequestCategory) {
        
        if let responseHandler = presenter {
            let interfaceObj = forgotPasswordUsecaseProvider.answerSecurityQuestionsForResetPasswordUsecase(requestType: requestType, handler: responseHandler)
            interfaceObj.answerSecurityQuestionsToResetPassword(request: request)
        }
    }
}
