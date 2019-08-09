//
//  File.swift
//  CMAA
//
//  Created by Latha, Sowjanya on 31/05/19.
//  Copyright © 2019 cnd. All rights reserved.
//

import Foundation
import Entities
protocol IRouter {
    func perform(viewModel: Any)
    func push(route: Route)
    func present(message: String)
    func pop()
}
