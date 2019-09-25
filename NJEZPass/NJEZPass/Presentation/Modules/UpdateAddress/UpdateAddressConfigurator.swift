//
//  UpdateAddressConfigurator.swift
//  NJEZPass
//
//  Created by Gudavarthi, Pardhu on 09/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
class UpdateAddressConfigurator {
    var interactor: UpdateAddressInteractor?
    var presenter: UpdateAddressPresenter?
    var router: UpdateAddressRouter?
    func build(viewController: UpdateAddressViewController) {
        interactor = UpdateAddressInteractor()
        presenter = UpdateAddressPresenter()
        router = UpdateAddressRouter(delegate: viewController)
        interactor?.presenter = presenter
        presenter?.viewController = viewController
    }
}
