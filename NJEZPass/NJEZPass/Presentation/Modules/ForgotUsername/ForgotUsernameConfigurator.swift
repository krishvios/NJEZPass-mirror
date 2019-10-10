//
//  ForgotUsernameConfigurator.swift
//  NJEZPass
//
//  Created by Gudavarthi, Pardhu on 08/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import Foundation
class ForgotUsernameConfigurator {
    var interactor: ForgotUsernameInteractor?
    var presenter: ForgotUsernamePresenter?
    var router: ForgotUsernameRouter?
    func build(viewController: ForgotUserNameVC) {
        interactor = ForgotUsernameInteractor()
        presenter = ForgotUsernamePresenter()
        router = ForgotUsernameRouter(delegate: viewController)
        interactor?.presenter = presenter
        presenter?.viewController = viewController
    }
}
