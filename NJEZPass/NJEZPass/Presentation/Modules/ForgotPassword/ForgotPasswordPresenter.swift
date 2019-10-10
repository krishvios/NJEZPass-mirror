//
//  ForgotPasswordPresenter.swift
//  NJEZPass
//
//  Created by Gudavarthi, Pardhu on 08/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
import Entities
import Domain

class ForgotPasswordPresenter {
    var viewController: IForgotPasswordViewable?
}

extension ForgotPasswordPresenter: IResponseHandler {
    
    func onSuccess<T>(response: T) {
        print("onSucess: ", response)
        if let responseModel = response as? ForgotPasswordModel.Response {
            var viewModel = ForgotPasswordModel.PresentionModel()
            viewModel.emailMessage = responseModel.emailMessage
            viewModel.emailId = responseModel.emailId
            viewModel.securityQuestion = responseModel.securityQuestion
            viewModel.securityAnswer = responseModel.securityAnswer
            viewModel.message = responseModel.message
            
            if responseModel.statusCode == "0" {
                viewController?.forgotPasswordSuccess(viewModel: viewModel)
            } else {
                viewModel.message = responseModel.message
                viewController?.forgotPasswordFailed(viewModel: viewModel)
            }
        }
    }
    
    func onError(err: APIError) {
        print("onError: ", err)
        var viewModel = ForgotPasswordModel.PresentionModel()
        viewModel.message = Localizer.sharedInstance.localizedStringForKey(key: AppStringKeys.updateFailure)
        viewController?.forgotPasswordFailed(viewModel: viewModel)
    }
}
