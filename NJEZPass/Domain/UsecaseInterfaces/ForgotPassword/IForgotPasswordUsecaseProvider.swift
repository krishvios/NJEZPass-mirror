//
//  IForgotPasswordUsecaseProvider.swift
//  Domain
//
//  Created by Gudavarthi, Pardhu on 09/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import Foundation

public protocol IForgotPasswordUsecaseProvider {
    
    func provideForgotPasswordUsecase(requestType: Constants.RequestCategory, handler: IResponseHandler) -> IForgotPasswordUsecase
    
    func sendEmailLinkForResetPasswordUsecase(requestType: Constants.RequestCategory, handler: IResponseHandler) -> IForgotPasswordUsecase
    
    func answerSecurityQuestionsForResetPasswordUsecase(requestType: Constants.RequestCategory, handler: IResponseHandler) -> IForgotPasswordUsecase
    
    func providSetNewPasswordUsecase(requestType: Constants.RequestCategory, handler: IResponseHandler) -> IForgotPasswordUsecase

}
