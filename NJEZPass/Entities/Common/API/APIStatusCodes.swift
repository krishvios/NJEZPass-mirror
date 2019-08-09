//
//  APIStatusCodes.swift
//  CMAA
//
//  Created by Latha, Sowjanya on 11/04/19.
//  Copyright © 2019 cnd. All rights reserved.
//

import UIKit

public enum APIStatusCodes: Int {

    // MARK: success status codes
    case success = 200
    case noContent = 204
    case created = 201
    case accepted = 202
    case partialContent = 206

    // MARK: failed status codes
    case badRequest = 400
    case unprocessableEntity = 422
    case requestRangeNotSafisfiable = 416
    case unauthorized = 401
    case forbidden = 403
    case notFound = 404
    case conflict = 409
    case gone = 410

    // MARK: BW Server Errors
    case internalServerError = 500
    case serviceUnavailable = 503
    case notImplemented = 501
}
