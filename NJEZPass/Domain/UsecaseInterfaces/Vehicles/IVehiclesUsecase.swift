//
//  IVehiclesUsecase.swift
//  Domain
//
//  Created by Gudavarthi, Pardhu on 05/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
import Entities

public protocol IVehiclesUsecase {
    func getVehiclesList(request: VehiclesListModel.Request)
    func searchVehicleswithPlateNumber(request: SearchVehiclesModel.Request)
    func addVechicle(request: AddVehicleModel.Request)
}
