//
//  LoginUsecaseProvider.swift
//  CMAA
//
//  Created by Latha, Sowjanya on 24/05/19.
//  Copyright © 2019 cnd. All rights reserved.
//

import Foundation
import Entities
import Domain
open class LoginUsecaseProvider: ILoginUsecaseProvider {
    public init() {

    }
    public func provideLoginUsecase(requestType: Constants.RequestCategory, handler: IResponseHandler) -> ILoginUsecase {
        switch requestType {
        case .local:
            return LoginUsecaseLocal(handler: handler)
        case .remote:
            return LoginUsecaseRemote<LoginModel.Response>(handler: handler)
        }
    }
}
