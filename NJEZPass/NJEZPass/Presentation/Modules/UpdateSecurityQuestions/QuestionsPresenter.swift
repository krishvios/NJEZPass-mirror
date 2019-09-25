//
//  QuestionsPresenter.swift
//  NJEZPass
//
//  Created by Gudavarthi, Pardhu on 09/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
import Entities
import Domain
class QuestionsPresenter {
    var viewController: IQuestionsViewable?
}

extension QuestionsPresenter: IResponseHandler {
    
    func onSuccess<T>(response: T) {
        print("onSucess: ", response)
        if let responseModel = response as? SecurityQuestionsModel.Response {
            var viewModel = SecurityQuestionsModel.PresentionModel()
            if let msg = responseModel.message {
                viewModel.message = msg
                viewController?.updateFailed(viewModel: viewModel)
            } else {
                
                viewController?.updateSuccess(viewModel: viewModel)
            }
        }
    }
    
    func onError(err: APIError) {
        print("onError: ", err)
        var viewModel = SecurityQuestionsModel.PresentionModel()
        viewModel.message = Localizer.sharedInstance.localizedStringForKey(key: AppStringKeys.updateFailure)
        viewController?.updateFailed(viewModel: viewModel)
    }
}
