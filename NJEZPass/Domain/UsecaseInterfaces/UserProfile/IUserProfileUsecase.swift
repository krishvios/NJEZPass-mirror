//
//  IUserProfileUsecase.swift
//  Domain
//
//  Created by Gudavarthi, Pardhu on 09/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
import Entities

public protocol IUserProfileUsecase {
    func getProfileOverview(action: String)
    func updateSecurityQuestions(request: SecurityQuestionsModel.Request)
    func updateAddress(request: UpdateAddressModel.Request)
    //digital envelop
    //forgot pwd
}
