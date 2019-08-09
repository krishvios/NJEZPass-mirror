//
//  APIError.swift
//  CMAA
//
//  Created by Latha, Sowjanya on 11/04/19.
//  Copyright © 2019 cnd. All rights reserved.
//

import UIKit

public struct APIErrorInfo: Codable {
    public struct SourceInfo: Codable {
        public var pointer: String
        public var index: Int?
        public init(pointer: String, index: Int?) {
            self.pointer = pointer
            self.index = index
        }
    }
    public var status: String
    public var code: String?
    public var source: SourceInfo
    public var fieldindex: Int?
    public var value: String
    public var message: String
    public var detail: String?
    public init(status: String, code: String?, source: SourceInfo, fieldindex: Int, value: String, message: String, detail: String?) {
        self.status = status
        self.code = code
        self.source = source
        self.fieldindex = fieldindex
        self.value = value
        self.message = message
        self.detail = detail
    }
}

public enum APIError {
    case noNetwork(error:Error?)
    case general(error:Error?)
    case sessionExpired(error:Error?)
    case customError(error:[APIErrorInfo]?)
}
