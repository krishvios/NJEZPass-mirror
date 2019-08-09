//
//  UserProfileUsecaseProvider.swift
//  Platform
//
//  Created by Gudavarthi, Pardhu on 09/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import Foundation
import Entities
import Domain

open class UserProfileUsecaseProvider: IUserProfileUsecaseProvider {
    
    public init() {
        
    }
    public func provideProfileOverviewUsecase(requestType: Constants.RequestCategory, handler: IResponseHandler) -> IUserProfileUsecase {
        switch requestType {
        case .local:
            return UserProfileUsecaseLocal(handler: handler)
        case .remote:
            return UserProfileUsecaseRemote<ProfileModel.Response>(handler: handler)
        }
    }
}
