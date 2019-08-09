//
//  ILoginViewable.swift
//  CMAA
//
//  Created by Latha, Sowjanya on 04/06/19.
//  Copyright © 2019 conduent. All rights reserved.
//

import Foundation
import Entities
protocol ILoginViewable {
    func loginSuccess(viewModel: LoginModel.PresentionModel)
    func loginFailed(viewModel: LoginModel.PresentionModel)
    func userProfileSuccess(viewModel: ProfileModel.PresentionModel)
    func userProfileFailed(viewModel: ProfileModel.PresentionModel)
}
