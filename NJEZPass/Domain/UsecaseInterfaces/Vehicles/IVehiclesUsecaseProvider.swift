//
//  IVehiclesUsecaseProvider.swift
//  Domain
//
//  Created by Gudavarthi, Pardhu on 05/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import Foundation

public protocol IVehiclesUsecaseProvider {
    
    func provideVechiclesListUsecase(requestType: Constants.RequestCategory, handler: IResponseHandler) -> IVehiclesUsecase
    func provideSearchVechiclewithPlateNoUsecase(requestType: Constants.RequestCategory, handler: IResponseHandler) -> IVehiclesUsecase
    func addVehicleUsecase(requestType: Constants.RequestCategory, handler: IResponseHandler) -> IVehiclesUsecase
}
