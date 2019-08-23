//
//  IEditProfileUsecase.swift
//  Domain
//
//  Created by Gudavarthi, Pardhu on 23/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import Foundation
import Entities

public protocol IEditProfileUsecase {
    func editProfile(request: EditProfileModel.Request)
}
