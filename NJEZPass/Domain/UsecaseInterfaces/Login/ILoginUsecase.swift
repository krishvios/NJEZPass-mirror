//
//  UserAPIProtocal.swift
//  CMAA
//
//  Created by Latha, Sowjanya on 15/04/19.
//  Copyright © 2019 cnd. All rights reserved.
//

import UIKit
import Entities

public protocol ILoginUsecase {
    func login(request: LoginModel.Request)
    func authorizeUser(request: AuthorizeModel.Request)
    func loadDynamicData(request: DynamicCacheModel.Request)
    func registerPushService(request: PushModel.Request)
    //digital envelop
    //forgot pwd
}
