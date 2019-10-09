//
//  ForgotPasswordUsecaseProvider.swift
//  Platform
//
//  Created by Gudavarthi, Pardhu on 09/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import Foundation
import Entities
import Domain

open class ForgotPasswordUsecaseProvider: IForgotPasswordUsecaseProvider {
    
    public init() {
       
       }
    
    public func provideForgotPasswordUsecase(requestType: Constants.RequestCategory, handler: IResponseHandler) -> IForgotPasswordUsecase {
           
        switch requestType {
        case .remote:
            return ForgotPasswordUsecaseRemote<ForgotPasswordModel.Response>(handler: handler)
        }
       }
}
