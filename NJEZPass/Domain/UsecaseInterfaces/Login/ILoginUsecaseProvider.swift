//
//  ILoginUsecaseProvider.swift
//  CMAA
//
//  Created by Latha, Sowjanya on 24/05/19.
//  Copyright © 2019 cnd. All rights reserved.
//

import Foundation
public protocol ILoginUsecaseProvider {
    func provideLoginUsecase(requestType: Constants.RequestCategory, handler: IResponseHandler) -> ILoginUsecase
    func provideLoadDynamicDataUsecase(requestType: Constants.RequestCategory, handler: IResponseHandler) -> ILoginUsecase
}
