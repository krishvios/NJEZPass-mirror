//
//  BankAccountModel.swift
//  Entities
//
//  Created by Gudavarthi, Pardhu on 22/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import Foundation

public enum BankAccountModel {
    public struct Request: Codable {
        public var accountType, accountNumber, bankRoutingNumber: String?
        public var expirationMonth, expirationYear: Int?
    }
    
    public struct Response: Codable {
        public var accountType, accountNumber, bankRoutingNumber: String?
        public var expirationMonth, expirationYear: Int?
    }
    
    public struct PresentationModel {
        public var message: String?
        public var route: Route?
    }
}
