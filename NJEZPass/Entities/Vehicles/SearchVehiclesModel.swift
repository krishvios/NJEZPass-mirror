//
//  SearchVehiclesModel.swift
//  Entities
//
//  Created by Gudavarthi, Pardhu on 08/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import Foundation

public enum SearchVehiclesModel {
    
    public struct Request: Codable {
        public init() {
        }
        
        public var action: String?
        public var serviceId: String?
        public var plateNumber: String?
        public var activeSearch: String?

        public init(action: String, serviceId: String, plateNumber: String, activeSearch: String) {
            
            self.action = action
            self.serviceId = serviceId
            self.plateNumber = plateNumber
            self.activeSearch = activeSearch
        }
    }
    
    public struct Response: Codable {
        public var vehicleList: VehicleList?
        public var statusCode, message: String?
    }

    // MARK: - VehicleList
    public struct VehicleList: Codable {
        public var vehicle: [Vehicle]?
        public var count: String?
    }

    // MARK: - Vehicle
    public struct Vehicle: Codable {
        public var plateNumber, state, country, plateType: String?
        public var year, vehicleType, make, model: String?
        public var index, vehicleColor, vehicleID, iagCode: String?
        public var iagCodeDesc, iagCodeIndex, isRentalVehicle: String?
        public var isTempPlate: Bool?
        public var rentalVehicleStartDate, isTrailerPlate: String?
    }
    
    public struct PresentionModel {
        public var message: String?
        public var route: Route?
        public init() {

        }
    }
}
