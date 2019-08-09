//
//  APIResponse.swift
//  CMAA
//
//  Created by Latha, Sowjanya on 11/04/19.
//  Copyright © 2019 cnd. All rights reserved.
//

import UIKit

public enum APIResponse<T> {
    case onSuccess(value:T)
    case onFailure(error:APIError)
}
