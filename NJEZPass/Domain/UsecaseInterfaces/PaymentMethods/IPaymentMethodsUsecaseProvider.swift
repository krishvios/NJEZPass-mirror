//
//  IPaymentMethodsUsecaseProvider.swift
//  Domain
//
//  Created by Gudavarthi, Pardhu on 22/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import Foundation
public protocol IPaymentMethodsUsecaseProvider {
    func providePaymentMethodsUsecase(requestType: Constants.RequestCategory, handler: IResponseHandler) -> IPaymentMethodsUsecase
    func provideAddBankAccountUsecase(requestType: Constants.RequestCategory, handler: IResponseHandler) -> IPaymentMethodsUsecase
    func provideEditBankAccountUsecase(requestType: Constants.RequestCategory, handler: IResponseHandler) -> IPaymentMethodsUsecase
    func provideDeleteBankAccountUsecase(requestType: Constants.RequestCategory, handler: IResponseHandler) -> IPaymentMethodsUsecase
    
    func provideAddCreditCardUsecase(requestType: Constants.RequestCategory, handler: IResponseHandler) -> IPaymentMethodsUsecase
    func provideEditCreditCardUsecase(requestType: Constants.RequestCategory, handler: IResponseHandler) -> IPaymentMethodsUsecase
    func provideDeleteCreditCardUsecase(requestType: Constants.RequestCategory, handler: IResponseHandler) -> IPaymentMethodsUsecase
}
