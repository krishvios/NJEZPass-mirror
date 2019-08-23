//
//  PaymentMethodsModel.swift
//  Entities
//
//  Created by Gudavarthi, Pardhu on 22/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import Foundation

public enum PaymentMethodsModel {
    
    public struct Request: Codable {

    }
    
    public struct Response: Codable {
        let firstName, lastName, middleInitial, addressLine1: String?
        let addressLine2, city, state, zipCode: String?
        let zipCodePlus, country: String?
        let paymentTypeList: [PaymentTypeList]?
    }
    
    // MARK: - PaymentTypeList
    public struct PaymentTypeList: Codable {
        let isPrimary: Bool?
        let accountType, accountNumber: String?
        let expirationMonth, expirationYear: Int?
        let bankRoutingNumber, maskedAccountNumber: String?
    }
    
    public struct PresentationModel {
        
        public var message: String?
        public var route: Route?
        public var paymentTypeList: PaymentTypeList?
        
        public init() {
            
        }
        
        public init(message: String?, paymentTypeList: PaymentTypeList?, route: Route?) {
            
            self.message = message
            self.paymentTypeList = paymentTypeList
            self.route = route
        }
    }
}
