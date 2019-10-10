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
            if let msg = responseModel.message {
                viewModel.message = msg
                viewController?.forgotPasswordFailed(viewModel: viewModel)
            } else {
                
                viewController?.forgotPasswordSuccess(viewModel: viewModel)
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
