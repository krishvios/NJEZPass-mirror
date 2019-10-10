//
//  ResetPasswordConfigurator.swift
//  NJEZPass
//
//  Created by Gudavarthi, Pardhu on 08/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import Foundation
class ResetPasswordConfigurator {
    var interactor: ResetPasswordInteractor?
    var presenter: ResetPasswordPresenter?
    var router: ResetPasswordRouter?
    func build(viewController: ResetPasswordVC) {
        interactor = ResetPasswordInteractor()
        presenter = ResetPasswordPresenter()
        router = ResetPasswordRouter(delegate: viewController)
        interactor?.presenter = presenter
        presenter?.viewController = viewController
    }
}
