//
//  QuestionsInteractor.swift
//  NJEZPass
//
//  Created by Gudavarthi, Pardhu on 09/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
import Entities
import Domain
import Platform

protocol IQuestionsInteractable {
    func updateSecurityQuestions(question: String, answer: String, requestType: Constants.RequestCategory)
}

class QuestionsInteractor {
    var presenter: IResponseHandler?
    var userProfileUsecaseProvider = UserProfileUsecaseProvider()
}

extension QuestionsInteractor: IQuestionsInteractable {
    
    func updateSecurityQuestions(question: String, answer: String, requestType: Constants.RequestCategory) {
        
        let request = SecurityQuestionsModel.Request()
        
        if let responseHandler = presenter {
            let interfaceObj = userProfileUsecaseProvider.provideUpdateSecurityQuestionsUsecase(requestType: requestType, handler: responseHandler)
            interfaceObj.updateSecurityQuestions(request: request)
        }
    }
}
