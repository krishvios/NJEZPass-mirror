//
//  Login.swift
//  NJEZPass
//
//  Created by Anshu Sharma on 29/07/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import Foundation


// MARK: - LoginAuth
struct LoginAuth: Codable {
    let accessToken, tokenType, refreshToken: String
    let expiresIn: Int
    let scope: String
    let agencyID, brokerID: Int
    let firstName: JSONNull?
    let permission: String
    let lastName: JSONNull?
    let jti: String
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
        case refreshToken = "refresh_token"
        case expiresIn = "expires_in"
        case scope
        case agencyID = "AgencyId"
        case brokerID = "BrokerId"
        case firstName = "FirstName"
        case permission = "Permission"
        case lastName = "LastName"
        case jti
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {
    
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    
    public var hashValue: Int {
        return 0
    }
    
    public func hash(into hasher: inout Hasher) {
        // No-op
    }
    
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
