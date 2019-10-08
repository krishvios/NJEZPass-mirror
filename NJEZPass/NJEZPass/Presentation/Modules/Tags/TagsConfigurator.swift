//
//  TagsConfigurator.swift
//  NJEZPass
//
//  Created by Gudavarthi, Pardhu on 08/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import Foundation
class TagsConfigurator {
    var interactor: TagsInteractor?
    var presenter: TagsPresenter?
    var router: TagsRouter?
    func build(viewController: TagsViewController) {
        interactor = TagsInteractor()
        presenter = TagsPresenter()
        router = TagsRouter(delegate: viewController)
        interactor?.presenter = presenter
        presenter?.viewController = viewController
    }
}
