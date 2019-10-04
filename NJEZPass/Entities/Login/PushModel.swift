//
//  PushModel.swift
//  Entities
//
//  Created by Gudavarthi, Pardhu on 03/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

//{
//"action":"pushService",
//"operationType":"REGISTER",
//"mobileOSType":"ANDROID",
//"systemVersion":"1.0",
//"appVersion":"2.0",
//"deviceToken":"0e0cd73a0c5db436bcfd7f1a32276e882009119ddc62d2089565d65ae77498da",
//"badgeCount":"0"
//}

public enum PushModel {
    
    public struct Request: Codable {
        public init() {
        }
        
        public var action: String?
        public var operationType: String?
        public var mobileOSType: String?
        public var systemVersion: String?
        public var appVersion: String?
        public var deviceToken: String?
        public var badgeCount: String?

        public init(action: String, operationType: String, mobileOSType: String, systemVersion: String, appVersion: String, deviceToken: String, badgeCount: String) {
            
            self.action = action
            self.operationType = operationType
            self.mobileOSType = mobileOSType
            self.systemVersion = systemVersion
            self.appVersion = appVersion
            self.deviceToken = deviceToken
            self.badgeCount = badgeCount
        }
    }
    
    public struct Response: Codable {
        public var statusCode, message: String?
        public var route: Route?
    }
    
    public struct PresentionModel {
        public var message: String?
        public var route: Route?
        public init() {

        }
    }
}
