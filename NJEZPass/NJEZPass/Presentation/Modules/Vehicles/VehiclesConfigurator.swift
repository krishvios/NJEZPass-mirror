//
//  VehiclesConfigurator.swift
//  NJEZPass
//
//  Created by Gudavarthi, Pardhu on 08/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import Foundation
class VehiclesConfigurator {
    var interactor: VehiclesInteractor?
    var presenter: VehiclesPresenter?
    var router: VehiclesRouter?
    func build(viewController: VehiclesViewController) {
        interactor = VehiclesInteractor()
        presenter = VehiclesPresenter()
        router = VehiclesRouter(delegate: viewController)
        interactor?.presenter = presenter
        presenter?.viewController = viewController
    }
}
