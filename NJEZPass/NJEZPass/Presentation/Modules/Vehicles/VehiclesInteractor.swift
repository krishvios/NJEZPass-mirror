//
//  VehiclesInteractor.swift
//  NJEZPass
//
//  Created by Gudavarthi, Pardhu on 08/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
import Entities
import Domain
import Platform

protocol IVehiclesInteractable {
    func getVechiclesList(action:String, requestType: Constants.RequestCategory)
    func searchVechiclewithPlateNumber(action: String, plateNo: String, requestType: Constants.RequestCategory)
}

class VehiclesInteractor {
    var presenter: IResponseHandler?
    var vechiclesUsecaseProvider = VehiclesUsecaseProvider()
}

extension VehiclesInteractor: IVehiclesInteractable {
    func getVechiclesList(action: String, requestType: Constants.RequestCategory) {
        
        let request = VehiclesListModel.Request()
        
        if let responseHandler = presenter {
            let interfaceObj = vechiclesUsecaseProvider.provideVechiclesListUsecase(requestType: requestType, handler: responseHandler)
            interfaceObj.getVehiclesList(request: request)
        }
    }
    
    func searchVechiclewithPlateNumber(action: String, plateNo: String, requestType: Constants.RequestCategory) {
        
        let request = SearchVehiclesModel.Request()
        
        if let responseHandler = presenter {
            let interfaceObj = vechiclesUsecaseProvider.provideSearchVechiclewithPlateNoUsecase(requestType: requestType, handler: responseHandler)
            interfaceObj.searchVehicleswithPlateNumber(request: request)
        }
    }
}
