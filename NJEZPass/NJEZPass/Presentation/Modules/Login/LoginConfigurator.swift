//
//  LoginBuilder.swift
//  CMAA
//
//  Created by Latha, Sowjanya on 27/05/19.
//  Copyright © 2019 cnd. All rights reserved.
//

import UIKit
class LoginConfigurator {
    var interactor: LoginInteractor?
    var presenter: LoginPresenter?
    var router: LoginRouter?
    func build(viewController: LandingVC) {
        interactor = LoginInteractor()
        presenter = LoginPresenter()
        router = LoginRouter(delegate: viewController)
        interactor?.presenter = presenter
        presenter?.viewController = viewController
    }
}
