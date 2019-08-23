//
//  EditProfileModel.swift
//  Entities
//
//  Created by Gudavarthi, Pardhu on 23/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import Foundation

public enum EditProfileModel {
    
    public struct Request: Codable {
        public var addressLine1, addressLine2, city, state: String?
        public var zipCode, zipCodePlus, country, daytimePhone: String?
        public var cellPhone, eveningPhone, fax: String?
        public var smsOptIn: Bool?
    }
    
    public struct Response: Codable {
        public var message: String?
        public var route: Route?
    }
    
    public struct PresentationModel {
        public var message: String?
        public var route: Route?
    }
    
}
