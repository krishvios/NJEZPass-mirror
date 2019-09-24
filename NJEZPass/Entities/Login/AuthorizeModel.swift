//
//  AuthorizeModel.swift
//  Entities
//
//  Created by Gudavarthi, Pardhu on 19/09/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
public enum AuthorizeModel {
    public struct Request: Codable {
        public init() {
        }
        
        public var action: String?
        public var vendorId: String?
        public var verificationToken: String?
        public var accessId: String?
        
        public init(action: String,vendorId: String,verificationToken: String, accessId: String) {
            self.action = action
            self.vendorId = vendorId
            self.verificationToken = verificationToken
            self.accessId = accessId
        }
    }
    
    public struct Response: Codable {
        public var authorizeUser: AuthorizeUser?
        public var failureMessage: String?
        public var route: Route?
    }
    
    public struct AuthorizeUser: Codable {
        public var serviceId: String?
    }
    
    public struct PresentionModel {
        public var message: String?
        public var serviceId: String?
        public var route: Route?
        public init() {
            
        }
    }
}
