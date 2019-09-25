//
//  UpdateAddressModel.swift
//  Entities
//
//  Created by Gudavarthi, Pardhu on 25/09/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import Foundation

public enum UpdateAddressModel {
    
    public struct Request: Codable {
        
        public var action, serviceId, addressLine1, addressLine2: String?
        public var city, state, zipcode, country, zipcodePlus: String?
        
        public init() {
            
        }
        
        public init(action: String, serviceId: String, addressLine1: String, addressLine2: String, city: String, state: String, zipcode: String, country:String, zipcodePlus: String) {
            
            self.action = action
            self.serviceId = serviceId
            self.addressLine1 = addressLine1
            self.addressLine2 = addressLine2
            self.city = city
            self.state = state
            self.zipcode = zipcode
            self.country = country
            self.zipcodePlus = zipcodePlus
            
        }
    }
    
    // MARK: - Response
    public struct Response: Codable {
        public var message: String?
        public var statusCode: String?
        public var route: Route?
        
        public init(message: String?, statusCode: String?, route:Route?) {
            
            self.message = message
            self.statusCode = statusCode
            self.route = route
        }
        
        public init() {
            
        }
    }
    
    public struct PresentionModel {
        public var message: String?
        public var route: Route?
        public init() {
            
        }
    }
}
