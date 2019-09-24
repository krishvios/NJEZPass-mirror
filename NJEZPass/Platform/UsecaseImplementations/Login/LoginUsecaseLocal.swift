//
//  LoginUsecaseLocalMem.swift
//  CMAA
//
//  Created by Latha, Sowjanya on 24/05/19.
//  Copyright © 2019 cnd. All rights reserved.
//

import Foundation
import Entities
import Domain

class LoginUsecaseLocal: ILoginUsecase {
    func authorizeUser(request: AuthorizeModel.Request) {
        
    }
    
    var responseHandler: IResponseHandler
    init(handler: IResponseHandler) {
        self.responseHandler = handler
    }
    
    func login(request: LoginModel.Request) {
        
    }
}
