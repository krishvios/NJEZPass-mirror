//
//  IEditProfileUsecaseProvider.swift
//  Domain
//
//  Created by Gudavarthi, Pardhu on 23/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import Foundation
public protocol IEditProfileUsecaseProvider {
    func provideEditProfileUsecase(requestType: Constants.RequestCategory, handler: IResponseHandler) -> IEditProfileUsecase
}
