//
//  SecurityQuestionsConfigurator.swift
//  NJEZPass
//
//  Created by Gudavarthi, Pardhu on 08/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import Foundation
class SecurityQuestionsConfigurator {
    var interactor: SecurityQuestionsInteractor?
    var presenter: SecurityQuestionsPresenter?
    var router: SecurityQuestionsRouter?
    func build(viewController: SecurityQuestionsVC) {
        interactor = SecurityQuestionsInteractor()
        presenter = SecurityQuestionsPresenter()
        router = SecurityQuestionsRouter(delegate: viewController)
        interactor?.presenter = presenter
        presenter?.viewController = viewController
    }
}
