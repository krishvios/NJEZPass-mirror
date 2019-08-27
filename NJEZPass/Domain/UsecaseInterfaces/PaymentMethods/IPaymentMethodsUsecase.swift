//
//  IPaymentMethodsUsecase.swift
//  Domain
//
//  Created by Gudavarthi, Pardhu on 22/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import Foundation
import Entities

public protocol IPaymentMethodsUsecase {
    func getPaymentMethods(request: PaymentMethodsModel.Request)
    func addBankAccount(request: BankAccountModel.Request)
    func editBankAccount(request: BankAccountModel.Request)
    func deleteBankAccount(request: BankAccountModel.Request)
    func addCreditCard(request: CreditCardModel.Request)
    func editCreditCard(request: CreditCardModel.Request)
    func deleteCreditCard(request: CreditCardModel.Request)

}
