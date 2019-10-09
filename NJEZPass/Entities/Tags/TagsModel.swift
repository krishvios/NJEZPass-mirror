//
//  TransponderModel.swift
//  Entities
//
//  Created by Gudavarthi, Pardhu on 04/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

//{
//"action":"getTransponderList",
//"serviceId":"MueiKITkTi1xNUJi9RphA3ouvTh/e7a6",
//"startIndex":"1",
//“count”:”10”
//}


public enum TagsModel {
    
    public struct Request: Codable {
        public init() {
        }
        
        public var action: String?
        public var serviceId: String?
        public var startIndex: String?
        public var count: String?

        public init(action: String, serviceId: String, startIndex: String, count: String) {
            
            self.action = action
            self.serviceId = serviceId
            self.startIndex = startIndex
            self.count = count
        }
    }
    
    // MARK: - Response
    public struct Response: Codable {
        public var transponderList: TransponderList?
        public var statusCode, message: String?
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
        public var transponderList: TransponderList?
        public init() {

        }
    }
}
