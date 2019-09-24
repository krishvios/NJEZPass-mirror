//
//  UserProfileUsecaseLocal.swift
//  Platform
//
//  Created by Gudavarthi, Pardhu on 09/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import Foundation
import Entities
import Domain

class UserProfileUsecaseLocal: IUserProfileUsecase {
    var responseHandler: IResponseHandler
    init(handler: IResponseHandler) {
        self.responseHandler = handler
    }
    
    func getProfileOverview(action: String) {
        
    }
}
