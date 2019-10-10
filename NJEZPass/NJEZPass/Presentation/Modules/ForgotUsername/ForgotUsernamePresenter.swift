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
            if responseModel.statusCode == "0" {
                viewController?.forgotUsernameSuccess(viewModel: viewModel)
            } else {
                viewController?.forgotUsernameFailed(viewModel: viewModel)
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
