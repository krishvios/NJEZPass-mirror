//
//  IForgotPasswordUsecaseProvider.swift
//  Domain
//
//  Created by Gudavarthi, Pardhu on 09/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import Foundation

public protocol IForgotPasswordUsecaseProvider {
    
    func provideForgotPasswordUsecase(requestType: Constants.RequestCategory, handler: IResponseHandler) -> IForgotPasswordUsecase
}
