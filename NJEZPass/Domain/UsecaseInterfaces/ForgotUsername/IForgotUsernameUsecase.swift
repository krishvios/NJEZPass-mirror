//
//  IForgotUsernameUsecase.swift
//  Domain
//
//  Created by Gudavarthi, Pardhu on 09/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import Foundation
import Entities

public protocol IForgotUsernameUsecase {
    func forgotUsername(request: ForgotUsernameModel.Request)
}
