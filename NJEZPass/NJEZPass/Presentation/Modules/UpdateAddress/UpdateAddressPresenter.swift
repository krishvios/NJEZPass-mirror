//
//  UpdateAddressPresenter.swift
//  NJEZPass
//
//  Created by Gudavarthi, Pardhu on 09/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
import Entities
import Domain
class UpdateAddressPresenter {
    var viewController: IUpdateAddressViewable?
}

extension UpdateAddressPresenter: IResponseHandler {
    
    func onSuccess<T>(response: T) {
        print("onSucess: ", response)
        if let responseModel = response as? UpdateAddressModel.Response {
            var viewModel = UpdateAddressModel.PresentionModel()
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
        var viewModel = UpdateAddressModel.PresentionModel()
        viewModel.message = Localizer.sharedInstance.localizedStringForKey(key: AppStringKeys.updateFailure)
        viewController?.updateFailed(viewModel: viewModel)
    }
}
