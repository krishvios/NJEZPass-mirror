//
//  VehiclesPresenter.swift
//  NJEZPass
//
//  Created by Gudavarthi, Pardhu on 08/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
import Entities
import Domain

class VehiclesPresenter {
    var viewController: IVehiclesViewable?
}

extension VehiclesPresenter: IResponseHandler {
    
    func onSuccess<T>(response: T) {
        print("onSucess: ", response)
        if let responseModel = response as? VehiclesListModel.Response {
            var viewModel = VehiclesListModel.PresentionModel()
            viewModel.vehicleList = responseModel.vehicleList
            if responseModel.statusCode == "0" {
                viewController?.getVehiclesSuccess(viewModel: viewModel)
            } else {
                viewModel.message = responseModel.message
                viewController?.getVehiclesFailed(viewModel: viewModel)
            }
        }
    }
    
    func onError(err: APIError) {
        print("onError: ", err)
        var viewModel = VehiclesListModel.PresentionModel()
        viewModel.message = Localizer.sharedInstance.localizedStringForKey(key: AppStringKeys.updateFailure)
        viewController?.getVehiclesFailed(viewModel: viewModel)
    }
}
