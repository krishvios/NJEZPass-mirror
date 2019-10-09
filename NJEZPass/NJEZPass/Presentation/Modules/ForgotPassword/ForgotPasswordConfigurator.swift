//
//  ForgotPasswordConfigurator.swift
//  NJEZPass
//
//  Created by Gudavarthi, Pardhu on 08/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import Foundation
class ForgotPasswordConfigurator {
    var interactor: ForgotPasswordInteractor?
    var presenter: ForgotPasswordPresenter?
    var router: ForgotPasswordRouter?
    func build(viewController: ForgotPasswordVC) {
        interactor = ForgotPasswordInteractor()
        presenter = ForgotPasswordPresenter()
        router = ForgotPasswordRouter(delegate: viewController)
        interactor?.presenter = presenter
        presenter?.viewController = viewController
    }
}
