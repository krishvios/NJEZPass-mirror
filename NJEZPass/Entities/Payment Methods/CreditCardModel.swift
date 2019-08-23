//
//  CreditCardModel.swift
//  Entities
//
//  Created by Gudavarthi, Pardhu on 22/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import Foundation

public enum CreditCardModel{
    
    public struct Request: Codable {
        let cardType, accountNumber: String?
        let expirationMonth, expirationYear: Int?
    }
    
    public struct Response: Codable {
        let cardType, accountNumber: String?
        let expirationMonth, expirationYear: Int?
    }
    
    public struct PresentationModel {
        public var message: String?
        public var route: Route?
    }
}
