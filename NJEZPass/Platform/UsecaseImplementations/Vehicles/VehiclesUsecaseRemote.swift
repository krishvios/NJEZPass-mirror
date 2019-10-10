//
//  VehiclesUsecaseRemote.swift
//  Platform
//
//  Created by Gudavarthi, Pardhu on 09/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import Foundation
import Entities
import Domain

internal class VehiclesUsecaseRemote<T: Codable>: IVehiclesUsecase {
    
    var responseHandler: IResponseHandler
        init(handler: IResponseHandler) {
            self.responseHandler = handler
        }
    
    func getVehiclesList(request: VehiclesListModel.Request) {
        
        let accessToken:String = PlatformUtility.serviceId!
        var listRequest = request
        listRequest.serviceId = accessToken
        
               let requestAPI = APIRequest<VehiclesListModel.Request>(method: .post, url: APIConstants.ServiceNames.getVechiclesService, headers: [APIConstants.HTTPStrings.contentTypeHeader: APIConstants.HTTPStrings.contentTypeJSON], params: listRequest, paramsEncoding: .json, multiPartImageDict: nil, mutliParamsDict: nil)
              
               APIService.shared.requestAPI(request: requestAPI, decodingType: T.self, completion: { response in
                  switch response {
                   case .onSuccess(let jsonData):
                      self.responseHandler.onSuccess(response: jsonData)
                   case .onFailure(let err):
                      self.responseHandler.onError(err: err)
                  }
               })
    }
    
    func searchVehicleswithPlateNumber(request: SearchVehiclesModel.Request) {
        
        let accessToken:String = PlatformUtility.serviceId!
               let requestAPI = APIRequest<SearchVehiclesModel.Request>(method: .post, url: APIConstants.ServiceNames.getVechiclesService, headers: [APIConstants.HTTPStrings.contentTypeHeader: APIConstants.HTTPStrings.contentTypeJSON, APIConstants.HTTPStrings.authorizationHeader: accessToken], params: nil, paramsEncoding: .json, multiPartImageDict: nil, mutliParamsDict: nil)
              
               APIService.shared.requestAPI(request: requestAPI, decodingType: T.self, completion: { response in
                  switch response {
                   case .onSuccess(let jsonData):
                      self.responseHandler.onSuccess(response: jsonData)
                   case .onFailure(let err):
                      self.responseHandler.onError(err: err)
                  }
               })
    }
    
    func addVechicle(request: AddVehicleModel.Request) {
        
        let accessToken:String = PlatformUtility.serviceId!
               let requestAPI = APIRequest<AddVehicleModel.Request>(method: .post, url: APIConstants.ServiceNames.addVechicleService, headers: [APIConstants.HTTPStrings.contentTypeHeader: APIConstants.HTTPStrings.contentTypeJSON, APIConstants.HTTPStrings.authorizationHeader: accessToken], params: nil, paramsEncoding: .json, multiPartImageDict: nil, mutliParamsDict: nil)
              
               APIService.shared.requestAPI(request: requestAPI, decodingType: T.self, completion: { response in
                  switch response {
                   case .onSuccess(let jsonData):
                      self.responseHandler.onSuccess(response: jsonData)
                   case .onFailure(let err):
                      self.responseHandler.onError(err: err)
                  }
               })
    }
}
