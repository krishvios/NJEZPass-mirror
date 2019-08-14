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
        public init() {
        }
    }

    public struct Response: Codable {
        
        public var accountInformation: AccountInformation?
        public var financialInformation: FinancialInformation?
        public var replenishmentInformation: ReplenishmentInformation?
        public var personalInformation: PersonalInformation?
        public var failureMessage: String?
        
        public var route: Route?
       
        public init(accountInformation: AccountInformation?, financialInformation: FinancialInformation?, replenishmentInformation: ReplenishmentInformation?, personalInformation: PersonalInformation?, failureMessage: String?, route: Route?) {
            
            self.accountInformation = accountInformation
            self.financialInformation = financialInformation
            self.replenishmentInformation = replenishmentInformation
            self.personalInformation = personalInformation
            self.failureMessage = failureMessage
            self.route = route
        }
        
        public init() {
        }
    }
    
    // MARK: - AccountInformation
    public struct AccountInformation: Codable {
        public var status, number, type: String?
        public var openViolationCount: Int?
        public var challengeQuestion, challengeAnswer, password: String?
        
        public init(status: String?, number: String?, type: String?, openViolationCount: Int?, challengeQuestion: String?, challengeAnswer: String?, password: String?) {
           
            self.status = status
            self.number = number
            self.type = type
            self.openViolationCount = openViolationCount
            self.challengeQuestion = challengeQuestion
            self.challengeAnswer = challengeAnswer
            self.password = password
        }
        
        public init() {
        }
        
    }
    
    // MARK: - FinancialInformation
    public struct FinancialInformation: Codable {
        public var financialStatus, statementDeliveryInterval, statementDeliveryMethod: String?
        public var tollBalance, violationBalance, currentBalance: Int?
    }
    
    // MARK: - PersonalInformation
    public struct PersonalInformation: Codable {
        public var userName, title, firstName, middleInitial: String?
        public var lastName, suffix, addressLine1, addressLine2: String?
        public var city, state, zipCode, zipCodePlus: String?
        public var country, daytimePhone, cellPhone, eveningPhone: String?
        public var fax, emailAddress, mobileAlerts, surveyOptIn: String?
    }
    
    // MARK: - ReplenishmentInformation
    public struct ReplenishmentInformation: Codable {
        public var type: String?
        public var automaticReplenishmentThreshold: Int?
        public var lastReplenishedDate: String?
        public var lastReplenishedAmount: Int?
    }
    
    public struct PresentionModel {
        public var message: String?
        public var detailInfo: DetailInfo?
        
        public struct DetailInfo {
            public var personalInformation: PersonalInformation?
            public var financialInformation: FinancialInformation?
            
            public init(personalInfo: PersonalInformation, financialInfo: FinancialInformation) {
                self.personalInformation = personalInfo
                self.financialInformation = financialInfo
            }
        }
        public var route: Route?
        public init() {
            
        }
        
        public init(message: String?, detailInfo: DetailInfo?, route: Route?) {
            
            self.message = message
            self.detailInfo = detailInfo
            self.route = route
        }
    }
}
