//
//  ForgotUsernamePresenter.swift
//  NJEZPass
//
//  Created by Gudavarthi, Pardhu on 08/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
import Entities
import Domain

class ForgotUsernamePresenter {
    var viewController: IForgotUsernameViewable?
}

extension ForgotUsernamePresenter: IResponseHandler {
    
    func onSuccess<T>(response: T) {
        print("onSucess: ", response)
        if let responseModel = response as? ForgotUsernameModel.Response {
            var viewModel = ForgotUsernameModel.PresentionModel()
            if let msg = responseModel.message {
                viewModel.message = msg
                viewController?.forgotUsernameFailed(viewModel: viewModel)
            } else {
                
                viewController?.forgotUsernameSuccess(viewModel: viewModel)
            }
        }
    }
    
    func onError(err: APIError) {
        print("onError: ", err)
        var viewModel = ForgotUsernameModel.PresentionModel()
        viewModel.message = Localizer.sharedInstance.localizedStringForKey(key: AppStringKeys.updateFailure)
        viewController?.forgotUsernameFailed(viewModel: viewModel)
    }
}
