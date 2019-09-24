//
//  DynamicCache.swift
//  Entities
//
//  Created by Gudavarthi, Pardhu on 24/09/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import Foundation

public enum DynamicCacheModel {
    public struct Request: Codable {
        public init() {
        }
        
        public var action: String?
       
        public init(action: String) {
            self.action = action
        }
    }
    
    // MARK: - Response
    public struct Response: Codable {
        public var dynamicPageLoad: DynamicPageLoad?
        public var statusCode: String?
        public var route: Route?
        
        public init(dynamicPageLoad: DynamicPageLoad?, statusCode: String?, route:Route?) {
            
            self.dynamicPageLoad = dynamicPageLoad
            self.statusCode = statusCode
            self.route = route
        }
        
        public init() {
            
        }
    }
    
    // MARK: - DynamicPageLoad
    public struct DynamicPageLoad: Codable {
        public var defaultState, defaultCountry: String?
        public var stateList, stateListCan, countryList, acctActStatusList: [String]?
        public var challangeQuestionList, accountTypeList, titleList, suffixTitleList: [String]?
        public var issueSubcatAcctUpdateList, issueSubcatAcctClosureList, issueSubcatAppStatusList, issueSubcatDisputeList: [String]?
//        public var issueSubcatDisputeViolList: [Any]?
        public var issueSubcatPaymentList, issueSubcatRequestList, issueSubcatStatementList, issueSubcatWebList: [String]?
        public var issueCategoryList, achTypeList, cardTypeList: [String]?
//        public var axleTypeList, axleAmountList: [Any]?
        public var vehicleMakeList, mountTypeList, accountCloseReasonList, correspondenceDiliveryList: [String]?
//        public var formLanguageList: [Any]?
        public var languageList, phoneTypeList: [String]?
//        public var plazaGroupList: [Any]?
        public var webTransactionFilterList, vehicleClassPrivateList, vehicleClassBusinessList, vehicleClassCommercialList: [String]?
        public var businessTagSpecificPlanList, privateTagSpecificPlanList: [String]?
        public var citationType, addressType, rebillPayType, laneMode: String?
        public var stmtDeliveryFreqBusiness: String?
        public var stmtDeliveryFreqBusinessList: [String]?
//        public var stmtDeliveryFreqPvideoregList: [Any]?
        public var stmtDeliveryFreqPrivateList: [String]?
//        public var stmtDeliveryFreqBvideoregList: [Any]?
        public var stmtDeliveryFreqPrivate, acctActiveStatus, tollRevenueType, deliveryFrequencyType: String?
        public var corrDeliveryMode, accountType, challengeQuestion, acctFinStatus: String?
        public var deliveryMethodType, statementMsgType: String?
    }
    
    public struct PresentionModel {
        public var message: String?
        public var dynamicPageLoad: DynamicPageLoad?
        public var route: Route?
        public init() {
            
        }
    }
}
