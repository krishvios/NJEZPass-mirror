//
//  IUserProfileUsecaseProvider.swift
//  Domain
//
//  Created by Gudavarthi, Pardhu on 09/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import Foundation

public protocol IUserProfileUsecaseProvider {
    
    func provideProfileOverviewUsecase(requestType: Constants.RequestCategory, handler: IResponseHandler) -> IUserProfileUsecase
}
