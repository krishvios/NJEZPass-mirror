//
//  EditProfileUsecaseProvider.swift
//  Platform
//
//  Created by Gudavarthi, Pardhu on 23/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import Foundation
import Entities
import Domain
open class EditProfileUsecaseProvider: IEditProfileUsecaseProvider {
    
    public init() {
    }
    
    public func provideEditProfileUsecase(requestType: Constants.RequestCategory, handler: IResponseHandler) -> IEditProfileUsecase {
        switch requestType {
        case .remote:
            return EditProfileUsecaseRemote<EditProfileModel.Response>(handler: handler)
        case .local:
            print("local")
            return EditProfileUsecaseRemote<EditProfileModel.Response>(handler: handler)
        }
    }
}
