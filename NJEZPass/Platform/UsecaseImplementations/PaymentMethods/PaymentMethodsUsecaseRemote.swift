//
//  PaymentMethodsUsecaseRemote.swift
//  Platform
//
//  Created by Gudavarthi, Pardhu on 26/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import Foundation
import Entities
import Domain

internal class PaymentMethodsUsecaseRemote<T: Codable>: IPaymentMethodsUsecase {
   
    var responseHandler: IResponseHandler
    init(handler: IResponseHandler) {
        self.responseHandler = handler
    }
    
    func getPaymentMethods(request: PaymentMethodsModel.Request) {
        
        let accessToken:String = PlatformUtility.accessToken!
        let requestAPI = APIRequest<PaymentMethodsModel.Request>(method: .get, url: APIConstants.ServiceNames.getPaymentMethods, headers: [APIConstants.HTTPStrings.contentTypeHeader: APIConstants.HTTPStrings.contentTypeJSON, APIConstants.HTTPStrings.authorizationHeader: accessToken], params: nil, paramsEncoding: .json, multiPartImageDict: nil, mutliParamsDict: nil)
        
        APIService.shared.requestAPI(request: requestAPI, decodingType: T.self, completion: { response in
            switch response {
            case .onSuccess(let jsonData):
                self.responseHandler.onSuccess(response: jsonData)
            case .onFailure(let err):
                self.responseHandler.onError(err: err)
            }
        })
    }
    
    func addBankAccount(request: BankAccountModel.Request) {
        
        let accessToken:String = PlatformUtility.accessToken!
        let requestAPI = APIRequest<BankAccountModel.Request>(method: .post, url: APIConstants.ServiceNames.modifyBankAccount, headers: [APIConstants.HTTPStrings.contentTypeHeader: APIConstants.HTTPStrings.contentTypeJSON, APIConstants.HTTPStrings.authorizationHeader: accessToken], params: nil, paramsEncoding: .json, multiPartImageDict: nil, mutliParamsDict: nil)
        
        APIService.shared.requestAPI(request: requestAPI, decodingType: T.self, completion: { response in
            switch response {
            case .onSuccess(let jsonData):
                self.responseHandler.onSuccess(response: jsonData)
            case .onFailure(let err):
                self.responseHandler.onError(err: err)
            }
        })
    }
    
    func editBankAccount(request: BankAccountModel.Request) {
        
        let accessToken:String = PlatformUtility.accessToken!
        let requestAPI = APIRequest<BankAccountModel.Request>(method: .put, url: APIConstants.ServiceNames.modifyBankAccount, headers: [APIConstants.HTTPStrings.contentTypeHeader: APIConstants.HTTPStrings.contentTypeJSON, APIConstants.HTTPStrings.authorizationHeader: accessToken], params: nil, paramsEncoding: .json, multiPartImageDict: nil, mutliParamsDict: nil)
        
        APIService.shared.requestAPI(request: requestAPI, decodingType: T.self, completion: { response in
            switch response {
            case .onSuccess(let jsonData):
                self.responseHandler.onSuccess(response: jsonData)
            case .onFailure(let err):
                self.responseHandler.onError(err: err)
            }
        })
        
    }
    
    func deleteBankAccount(request: BankAccountModel.Request) {
        
        let accessToken:String = PlatformUtility.accessToken!
        let requestAPI = APIRequest<BankAccountModel.Request>(method: .delete, url: APIConstants.ServiceNames.modifyBankAccount, headers: [APIConstants.HTTPStrings.contentTypeHeader: APIConstants.HTTPStrings.contentTypeJSON, APIConstants.HTTPStrings.authorizationHeader: accessToken], params: nil, paramsEncoding: .json, multiPartImageDict: nil, mutliParamsDict: nil)
        
        APIService.shared.requestAPI(request: requestAPI, decodingType: T.self, completion: { response in
            switch response {
            case .onSuccess(let jsonData):
                self.responseHandler.onSuccess(response: jsonData)
            case .onFailure(let err):
                self.responseHandler.onError(err: err)
            }
        })
    }
    
    func addCreditCard(request: CreditCardModel.Request) {
        
        let accessToken:String = PlatformUtility.accessToken!
        let requestAPI = APIRequest<CreditCardModel.Request>(method: .post, url: APIConstants.ServiceNames.modifyCreditCard, headers: [APIConstants.HTTPStrings.contentTypeHeader: APIConstants.HTTPStrings.contentTypeJSON, APIConstants.HTTPStrings.authorizationHeader: accessToken], params: nil, paramsEncoding: .json, multiPartImageDict: nil, mutliParamsDict: nil)
        
        APIService.shared.requestAPI(request: requestAPI, decodingType: T.self, completion: { response in
            switch response {
            case .onSuccess(let jsonData):
                self.responseHandler.onSuccess(response: jsonData)
            case .onFailure(let err):
                self.responseHandler.onError(err: err)
            }
        })
        
    }
    
    func editCreditCard(request: CreditCardModel.Request) {
        
        let accessToken:String = PlatformUtility.accessToken!
        let requestAPI = APIRequest<CreditCardModel.Request>(method: .put, url: APIConstants.ServiceNames.modifyCreditCard, headers: [APIConstants.HTTPStrings.contentTypeHeader: APIConstants.HTTPStrings.contentTypeJSON, APIConstants.HTTPStrings.authorizationHeader: accessToken], params: nil, paramsEncoding: .json, multiPartImageDict: nil, mutliParamsDict: nil)
        
        APIService.shared.requestAPI(request: requestAPI, decodingType: T.self, completion: { response in
            switch response {
            case .onSuccess(let jsonData):
                self.responseHandler.onSuccess(response: jsonData)
            case .onFailure(let err):
                self.responseHandler.onError(err: err)
            }
        })
    }
    
    func deleteCreditCard(request: CreditCardModel.Request) {
        
        let accessToken:String = PlatformUtility.accessToken!
        let requestAPI = APIRequest<CreditCardModel.Request>(method: .delete, url: APIConstants.ServiceNames.modifyCreditCard, headers: [APIConstants.HTTPStrings.contentTypeHeader: APIConstants.HTTPStrings.contentTypeJSON, APIConstants.HTTPStrings.authorizationHeader: accessToken], params: nil, paramsEncoding: .json, multiPartImageDict: nil, mutliParamsDict: nil)
        
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
