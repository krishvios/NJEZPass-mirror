//
//  IEditProfileViewable.swift
//  CMAA
//
//  Created by Vivek, Amirapu on 22/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import Foundation
import Entities
protocol IEditProfileViewable {
    func updateProfileSuccess(viewModel: ProfileModel.PresentionModel)
    func updateProfileFailed(viewModel: ProfileModel.PresentionModel)
}
