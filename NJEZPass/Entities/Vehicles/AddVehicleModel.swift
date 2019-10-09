//
//  VehicleModel.swift
//  Entities
//
//  Created by Gudavarthi, Pardhu on 08/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import Foundation

public enum AddVehicleModel {
    
    public struct Request: Codable {
        public init() {
        }
        
        public var action, serviceId, plateNumber, plateSate: String?
        public var vehicleYear, vehicleMake, vehicleModel, vehicleCountry: String?
        public var plateTypedesc, vehicleType, isRental, vehicleStartdate: String?
        public var vehicelStartTime, vehicleEnddate, vehicleEndTime: String?

        public init(action: String, serviceId: String, plateNumber: String, plateSate: String, vehicleYear: String, vehicleMake: String, vehicleModel: String, vehicleCountry: String, plateTypedesc: String, vehicleType: String, isRental: String, vehicleStartdate: String, vehicelStartTime: String, vehicleEnddate: String, vehicleEndTime: String) {
            
            self.action = action
            self.serviceId = serviceId
            self.plateNumber = plateNumber
            self.plateSate = plateSate
            self.vehicleYear = vehicleYear
            self.vehicleMake = vehicleMake
            self.vehicleModel = vehicleModel
            self.vehicleCountry = vehicleCountry
            self.plateTypedesc = plateTypedesc
            self.vehicleType = vehicleType
            self.isRental = isRental
            self.vehicleStartdate = vehicleStartdate
            self.vehicleEnddate = vehicleEnddate
            self.vehicelStartTime = vehicelStartTime
            self.vehicleEndTime = vehicleEndTime
            
        }
    }
    
    public struct Response: Codable {
        public var statusCode, message: String?
    }
    
    public struct PresentionModel {
        public var message: String?
        public var route: Route?
        public init() {

        }
    }
}
