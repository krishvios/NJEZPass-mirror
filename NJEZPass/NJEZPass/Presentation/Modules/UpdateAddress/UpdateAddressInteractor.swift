//
//  UpdateAddressInteractor.swift
//  NJEZPass
//
//  Created by Gudavarthi, Pardhu on 09/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
import Entities
import Domain
import Platform

protocol IUpdateAddressInteractable {
    func updateAddress(address1: String, address2: String, requestType: Constants.RequestCategory)
}

class UpdateAddressInteractor {
    var presenter: IResponseHandler?
    var userProfileUsecaseProvider = UserProfileUsecaseProvider()
}

extension UpdateAddressInteractor: IUpdateAddressInteractable {
    
    func updateAddress(address1: String, address2: String, requestType: Constants.RequestCategory) {

        let request = UpdateAddressModel.Request()
        
        if let responseHandler = presenter {
            let interfaceObj = userProfileUsecaseProvider.provideUpdateAddressUsecase(requestType: requestType, handler: responseHandler)
            interfaceObj.updateAddress(request: request)
        }
    }
}
