//
//  SecurityQuestionsPresenter.swift
//  NJEZPass
//
//  Created by Gudavarthi, Pardhu on 08/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
import Entities
import Domain

class SecurityQuestionsPresenter {
    var viewController: ISecurityQuestionsViewable?
}

extension SecurityQuestionsPresenter: IResponseHandler {
    
    func onSuccess<T>(response: T) {
        print("onSucess: ", response)
        if let responseModel = response as? ResetPasswordModel.Response {
            var viewModel = ResetPasswordModel.PresentionModel()
            if responseModel.statusCode == "0" {
                viewController?.answerSecurityQuestionsSuccess(viewModel: viewModel)
            } else {
                viewModel.message = responseModel.message
                viewController?.answerSecurityQuestionsFailed(viewModel: viewModel)
            }
        }
    }
    
    func onError(err: APIError) {
        print("onError: ", err)
        var viewModel = ResetPasswordModel.PresentionModel()
        viewModel.message = Localizer.sharedInstance.localizedStringForKey(key: AppStringKeys.updateFailure)
        viewController?.answerSecurityQuestionsFailed(viewModel: viewModel)
    }
}
