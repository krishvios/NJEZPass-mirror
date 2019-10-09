//
//  VehiclesUsecaseProvider.swift
//  Platform
//
//  Created by Gudavarthi, Pardhu on 09/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import Foundation
import Entities
import Domain

open class VehiclesUsecaseProvider: IVehiclesUsecaseProvider {
    
    public init() {
       
       }
    
    public func provideVechiclesListUsecase(requestType: Constants.RequestCategory, handler: IResponseHandler) -> IVehiclesUsecase {
        
        switch requestType {
               case .remote:
                   return VehiclesUsecaseRemote<VehiclesListModel.Response>(handler: handler)
               }
    }
    
    public func provideSearchVechiclewithPlateNoUsecase(requestType: Constants.RequestCategory, handler: IResponseHandler) -> IVehiclesUsecase {
        
        switch requestType {
               case .remote:
                   return VehiclesUsecaseRemote<SearchVehiclesModel.Response>(handler: handler)
               }
    }
    
    public func addVehicleUsecase(requestType: Constants.RequestCategory, handler: IResponseHandler) -> IVehiclesUsecase {
        
        switch requestType {
               case .remote:
                   return VehiclesUsecaseRemote<AddVehicleModel.Response>(handler: handler)
               }
    }
    
}

