//
//  ForgotUsernameUsecaseProvider.swift
//  Platform
//
//  Created by Gudavarthi, Pardhu on 09/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import Foundation
import Entities
import Domain

open class ForgotUsernameUsecaseProvider: IForgotUsernameUsecaseProvider {
    
    public init() {
       
       }
    
    public func provideForgotUsernameUsecase(requestType: Constants.RequestCategory, handler: IResponseHandler) -> IForgotUsernameUsecase {
           
        switch requestType {
        case .remote:
            return ForgotUsernameUsecaseRemote<ForgotUsernameModel.Response>(handler: handler)
        }
       }
}
