//
//  QuestionsConfigurator.swift
//  NJEZPass
//
//  Created by Gudavarthi, Pardhu on 09/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
class QuestionsConfigurator {
    var interactor: QuestionsInteractor?
    var presenter: QuestionsPresenter?
    var router: QuestionsRouter?
    func build(viewController: QuestionsViewController) {
        interactor = QuestionsInteractor()
        presenter = QuestionsPresenter()
        router = QuestionsRouter(delegate: viewController)
        interactor?.presenter = presenter
        presenter?.viewController = viewController
    }
}
