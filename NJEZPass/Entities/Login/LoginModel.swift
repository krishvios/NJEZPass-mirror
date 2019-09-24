//
//  PaymentMethodsUsecaseProvider.swift
//  Platform
//
//  Created by Gudavarthi, Pardhu on 26/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

public enum LoginModel {
    public struct Request: Codable {
        public init() {
        }
        
        public var action: String?
        public var loginType: String?
        public var password: String?
        public var vendorId: String?
        public var model: String?
        public var systemVersion: String?
        public var appVersion: String?
        public var verificationToken: String?

        public init(action: String, loginType: String, password: String, vendorId: String, model: String, systemVersion: String, appVersion: String, verificationToken: String) {
            self.action = action
            self.loginType = loginType
            self.password = password
            self.vendorId = vendorId
            self.model = model
            self.systemVersion = systemVersion
            self.appVersion = appVersion
            self.verificationToken = verificationToken
        }
    }
    
    public struct Response: Codable {
        public var loginUser: LoginUser?
        public var statusCode, message, permission: String?
        public var failureMessage: String?
        public var route: Route?
        
//        public init(loginUser: LoginUser?, statusCode: String?, message: String?, permission: String?, failureMessage: String?, route: Route?) {
//
//            self.loginUser = loginUser
//            self.statusCode = statusCode
//            self.message = message
//            self.permission = permission
//            self.failureMessage = failureMessage
//            self.route = route
//        }
//
//        public init() {
//
//        }
    }
    
    public struct LoginUser: Codable {
        public var accessId, nixieFlag, suggestedAmount, firstTimeLogin: String?
        
//        public init(accessId: String?, nixieFlag: String?, suggestedAmount: String?, firstTimeLogin: String?) {
//
//            self.accessId = accessId
//            self.nixieFlag = nixieFlag
//            self.suggestedAmount = suggestedAmount
//            self.firstTimeLogin = firstTimeLogin
//        }
//
//        public init() {
//
//        }
    }
    
    public struct PresentionModel {
        public var message: String?
        public var accessId: String?
        public var nixieFlag: String?
        public var suggestedAmount: String?
        public var firstTimeLogin: String?
        public var route: Route?
        public init() {

        }
    }
}
