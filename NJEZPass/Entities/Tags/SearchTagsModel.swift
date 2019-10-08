//
//  SearchTagsModel.swift
//  Entities
//
//  Created by Gudavarthi, Pardhu on 08/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

public enum SearchTagsModel {
    
    public struct Request: Codable {
        public init() {
        }
        
        public var action: String?
        public var serviceId: String?
        public var startIndex: String?
        public var transponderNumber: String?

        public init(action: String, serviceId: String, startIndex: String, transponderNumber: String) {
            
            self.action = action
            self.serviceId = serviceId
            self.startIndex = startIndex
            self.transponderNumber = transponderNumber
        }
    }
    
    // MARK: - Response
    public struct Response: Codable {
        public var transponderList: TransponderList
        public var statusCode, message: String
    }

    // MARK: - TransponderList
    public struct TransponderList: Codable {
        public var transponder: [Transponder]
        public var count: String
    }

    // MARK: - Transponder
    public struct Transponder: Codable {
        public var status, date, vehicleType, index: String
        public var transponderNo, basePrice, mountType, deviceColor: String
        public var parking, deviceType: String
    }
    
    public struct PresentionModel {
        public var message: String?
        public var route: Route?
        public init() {

        }
    }
}
