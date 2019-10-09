//
//  IForgotUsernameUsecaseProvider.swift
//  Domain
//
//  Created by Gudavarthi, Pardhu on 09/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import Foundation

public protocol IForgotUsernameUsecaseProvider {
    
    func provideForgotUsernameUsecase(requestType: Constants.RequestCategory, handler: IResponseHandler) -> IForgotUsernameUsecase
}
