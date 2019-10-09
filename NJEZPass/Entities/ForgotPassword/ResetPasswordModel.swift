//
//  ResetPasswordModel.swift
//  Entities
//
//  Created by Gudavarthi, Pardhu on 09/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

public enum ResetPasswordModel {
    
    public struct Request: Codable {
        public init() {
        }
        
        public var action, userName, accountNumber, zipCode: String?
        public var securityQuestion, securityAnswer, newPassword, retypePassword: String?
        public var emailFlag: String?

        public init(action: String, userName: String, accountNumber: String, zipCode: String,securityQuestion: String, securityAnswer: String, newPassword: String, retypePassword: String, emailFlag: String) {
            
            self.action = action
            self.userName = userName
            self.accountNumber = accountNumber
            self.zipCode = zipCode
            self.securityQuestion = securityQuestion
            self.securityAnswer = securityAnswer
            self.newPassword = newPassword
            self.retypePassword = retypePassword
            self.emailFlag = emailFlag
        }
    }
    
    // MARK: - Response
    public struct Response: Codable {
         public var statusCode, message: String?
    }
    
    public struct PresentionModel {
        public var message: String?
        public var route: Route?
        public init() {

        }
    }
}
