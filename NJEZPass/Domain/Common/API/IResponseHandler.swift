//
//  ResponseHandler.swift
//  CMAA
//
//  Created by Latha, Sowjanya on 24/05/19.
//  Copyright © 2019 cnd. All rights reserved.
//

import Foundation
import Entities

public protocol IResponseHandler {
//    func handleResponse(response: APIResponse<Data>)
    func onSuccess<T>(response: T)
    func onError(err: APIError)
}
