//
//  NewPasswordConfigurator.swift
//  NJEZPass
//
//  Created by Gudavarthi, Pardhu on 08/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import Foundation
class NewPasswordConfigurator {
    var interactor: NewPasswordInteractor?
    var presenter: NewPasswordPresenter?
    var router: NewPasswordRouter?
    func build(viewController: NewPasswordVC) {
        interactor = NewPasswordInteractor()
        presenter = NewPasswordPresenter()
        router = NewPasswordRouter(delegate: viewController)
        interactor?.presenter = presenter
        presenter?.viewController = viewController
    }
}
