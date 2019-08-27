//
//  PaymentMethodsUsecaseProvider.swift
//  Platform
//
//  Created by Gudavarthi, Pardhu on 26/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import Foundation
import Entities
import Domain
open class PaymentMethodsUsecaseProvider: IPaymentMethodsUsecaseProvider {
    
    public init() {
    }
    
    public func providePaymentMethodsUsecase(requestType: Constants.RequestCategory, handler: IResponseHandler) -> IPaymentMethodsUsecase {
        switch requestType {
        case .remote:
            return PaymentMethodsUsecaseRemote<PaymentMethodsModel.Response>(handler: handler)
        }
    }
    
    public func provideAddBankAccountUsecase(requestType: Constants.RequestCategory, handler: IResponseHandler) -> IPaymentMethodsUsecase {
        switch requestType {
        case .remote:
            return PaymentMethodsUsecaseRemote<PaymentMethodsModel.Response>(handler: handler)
        }
    }
    
    public func provideEditBankAccountUsecase(requestType: Constants.RequestCategory, handler: IResponseHandler) -> IPaymentMethodsUsecase {
        switch requestType {
        case .remote:
            return PaymentMethodsUsecaseRemote<PaymentMethodsModel.Response>(handler: handler)
        }
    }
    
    public func provideDeleteBankAccountUsecase(requestType: Constants.RequestCategory, handler: IResponseHandler) -> IPaymentMethodsUsecase {
        switch requestType {
        case .remote:
            return PaymentMethodsUsecaseRemote<PaymentMethodsModel.Response>(handler: handler)
        }
    }
    
    public func provideAddCreditCardUsecase(requestType: Constants.RequestCategory, handler: IResponseHandler) -> IPaymentMethodsUsecase {
        switch requestType {
        case .remote:
            return PaymentMethodsUsecaseRemote<PaymentMethodsModel.Response>(handler: handler)
        }
    }
    
    public func provideEditCreditCardUsecase(requestType: Constants.RequestCategory, handler: IResponseHandler) -> IPaymentMethodsUsecase {
        switch requestType {
        case .remote:
            return PaymentMethodsUsecaseRemote<PaymentMethodsModel.Response>(handler: handler)
        }
    }
    
    public func provideDeleteCreditCardUsecase(requestType: Constants.RequestCategory, handler: IResponseHandler) -> IPaymentMethodsUsecase {
        switch requestType {
        case .remote:
            return PaymentMethodsUsecaseRemote<PaymentMethodsModel.Response>(handler: handler)
        }
    }
}
