//
//  IForgotPasswordUsecase.swift
//  Domain
//
//  Created by Gudavarthi, Pardhu on 09/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import Foundation
import Entities

public protocol IForgotPasswordUsecase {
    func forgotPassword(request: ForgotPasswordModel.Request)
    func sendEmailLinkToResetPassword(request: ResetPasswordModel.Request)
    func answerSecurityQuestionsToResetPassword(request: ResetPasswordModel.Request)
    func setNewPassword(request: ResetPasswordModel.Request)
}
