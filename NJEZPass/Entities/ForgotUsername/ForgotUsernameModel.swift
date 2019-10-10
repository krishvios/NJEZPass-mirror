//
//  ForgotUsernameModel.swift
//  Entities
//
//  Created by Gudavarthi, Pardhu on 09/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

//{
//"action":"forgotUsername",
//“accountNumber”:””,
//"tagNumber":"29746142",
//"zipCode":"32830"
//}

public enum ForgotUsernameModel {
    
    public struct Request: Codable {
        
        public init() {
        }
        public var action, accountNumber, tagNumber, zipCode: String?

        public init(action: String, accountNumber: String, tagNumber: String, zipCode: String) {
            
            self.action = action
            self.accountNumber = accountNumber
            self.tagNumber = tagNumber
            self.zipCode = zipCode
        }
    }
    
    // MARK: - Response
    public struct Response: Codable {
         public var statusCode, message, userName: String?
    }
    
    public struct PresentionModel {
        public var message: String?
        public var route: Route?
        public init() {

        }
    }
}
