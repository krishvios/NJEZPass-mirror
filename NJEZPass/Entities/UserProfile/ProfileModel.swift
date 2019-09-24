//
//  UserProfileModel.swift
//  Entities
//
//  Created by Gudavarthi, Pardhu on 09/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
public enum ProfileModel {
    public struct Request: Codable {
        
        public var action: String?
        public var serviceId: String?
        
        public init(action: String,serviceId: String) {
            self.action = action
            self.serviceId = serviceId
        }
        
        public init() {
        }
    }
    
    // MARK: - Response
   public struct Response: Codable {
        public var accountDetail: AccountDetail?
        public var statusCode, message: String?
        public var route: Route?
        
        public init(accountDetail: AccountDetail, statusCode: String, message: String, route: Route) {
            
            self.accountDetail = accountDetail
            self.statusCode = statusCode
            self.message = message
            self.route = route
        }
        
        public init() {
        }
    }
    
    // MARK: - AccountDetail
    public struct AccountDetail: Codable {
        public var currentBalance, openViolCount, accountClosingDate, accountOpeningDate: String?
        public var username: String?
        public var messageCount: Int?
        public var accountNumber, addressLine1, addressLine2, city: String?
        public var state, zipCode, emailAddress, balancePPTL: String?
        public var lastReplenishedDate, replenishedAmount, replenishedThreshold, fullName: String?
        public var prepaidTools, volationsBalance: String?
        public var emailTemp: Bool?
        public var noOfTags, noOfVehicles, rebillPayType, currentMax: String?
        public var postpaidBalance, phoneNumberCell: String?
        public var tollTxList: [TollTxList]?
        public var commuterTripList: [CommuterTripList]?
        
        public init() {
            
        }
    }
    
    // MARK: - CommuterTripList
    public struct CommuterTripList: Codable {
        public var accountTag, planType, tripsUsed, tripsLeft: String?
        public var startDate, endDate: String?
    }
    
    // MARK: - TollTxList
    public struct TollTxList: Codable {
        public var transactionDate, transponder, entryPlaza, entryLane: String?
        public var exitPlaza, exitLane, tollTxListDescription, amount: String?
        public var transactionTime, cscLookupKey, exitPlazaName, tagorplate: String?
        public var agencyShortName: String?
    }
    
    public struct PresentionModel {
        public var message: String?
        public var accountDetail: AccountDetail?
        public var route: Route?
        public init() {
            
        }
        
    }
}
