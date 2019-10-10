//
//  SecurityQuestionsInteractor.swift
//  NJEZPass
//
//  Created by Gudavarthi, Pardhu on 08/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
import Entities
import Domain
import Platform

protocol ISecurityQuestionsInteractable {
    func answerSecurityQuestions(request:ResetPasswordModel.Request, requestType: Constants.RequestCategory)
}

class SecurityQuestionsInteractor {
    var presenter: IResponseHandler?
    var forgotPasswordUsecaseProvider = ForgotPasswordUsecaseProvider()
}

extension SecurityQuestionsInteractor: ISecurityQuestionsInteractable {
    
    func answerSecurityQuestions(request: ResetPasswordModel.Request, requestType: Constants.RequestCategory) {
        
        if let responseHandler = presenter {
                   let interfaceObj = forgotPasswordUsecaseProvider.answerSecurityQuestionsForResetPasswordUsecase(requestType: requestType, handler: responseHandler)
                   interfaceObj.answerSecurityQuestionsToResetPassword(request: request)
               }
    }
}
