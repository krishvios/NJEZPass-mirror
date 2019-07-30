//
//  Constants.swift
//  NJEZPass
//
//  Created by Anshu Sharma on 28/07/19.
//  Copyright © 2019 Anshu Sharma. All rights reserved.
//

import Foundation
struct K {
    struct QAServer {
        static let baseURL = "https://maas-test.services.conduent.com/"
        
        //https://maas-test.services.conduent.com/payments/api/account/paymentmethods
        //https://maas-test.services.conduent.com/oauth/token?
    }
    
    struct APIParameterKey {
        static let password = "password"
        static let grantType = "grant_type"
        static let clientId = "client_id"
        static let clientSecret = "client_secret"
        static let agencyID = "agencyID"
        static let loginType = "loginType"
        static let value = "value"

    }
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}
