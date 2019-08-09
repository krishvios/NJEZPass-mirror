//
//  APIModel.swift
//  CMAA
//
//  Created by Latha, Sowjanya on 11/04/19.
//  Copyright © 2019 cnd. All rights reserved.
//

import Foundation
public struct MultiPartDataInfo {
    public enum MimeType: String {
        case image = "image/jpeg"
    }
    public var data: Data
    public var key: String
    public var fileName: String
    public var mimeType: MimeType
    public init(data: Data, key: String, fileName: String, mimeType: MimeType) {
        self.data = data
        self.key = key
        self.fileName = fileName
        self.mimeType = mimeType
    }
}
public struct APIRequest<T: Codable> {
    public enum HTTPMethod: String {
        case get = "GET"
        case post = "POST"
        case put = "PUT"
        case patch = "PATCH"
        case delete = "DELETE"
    }
    public enum Encoding {
        case urlEncoded
        case json
    }
    public var method: HTTPMethod
    public var url: String
    public var headers: [String: String]?
    public var params: T?//[String: Any]?
    public var paramsEncoding: Encoding
    public var multiPartImageDict: [MultiPartDataInfo]?
    public var mutliParamsDict: [String: String]?

    public init(method: HTTPMethod, url: String, headers: [String: String]?, params: T?, paramsEncoding: Encoding, multiPartImageDict: [MultiPartDataInfo]?, mutliParamsDict: [String: String]?) {
        self.method = method
        self.url = url
        self.headers = headers
        self.params = params
        self.paramsEncoding = paramsEncoding
        self.multiPartImageDict = multiPartImageDict
        self.mutliParamsDict = mutliParamsDict
    }
}
