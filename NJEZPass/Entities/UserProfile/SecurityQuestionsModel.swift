//
//  SecurityQuestionsModel.swift
//  Entities
//
//  Created by Gudavarthi, Pardhu on 24/09/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import Foundation

public enum SecurityQuestionsModel {
    
    public struct Request: Codable {
        public var action, serviceId, challengeQuestionOne, challengeAnswerOne: String?
        public var challengeQuestionTwo, challengeAnswerTwo, challengeQuestionThree, challengeAnswerThree: String?
        
        public init() {
            
        }
        
        public init(action: String, serviceId: String, challengeQuestionOne: String, challengeQuestionTwo: String, challengeQuestionThree: String, challengeAnswerOne: String, challengeAnswerTwo: String, challengeAnswerThree:String) {
            
            self.action = action
            self.serviceId = serviceId
            self.challengeQuestionOne = challengeQuestionOne
            self.challengeQuestionTwo = challengeQuestionTwo
            self.challengeQuestionThree = challengeQuestionThree
            self.challengeAnswerOne = challengeAnswerOne
            self.challengeAnswerTwo = challengeAnswerTwo
            self.challengeAnswerThree = challengeAnswerThree
            
        }
    }
    
    // MARK: - Response
    public struct Response: Codable {
        public var message: String?
        public var statusCode: String?
        public var route: Route?
        
        public init(message: String?, statusCode: String?, route:Route?) {
            
            self.message = message
            self.statusCode = statusCode
            self.route = route
        }
        
        public init() {
            
        }
    }
    
    public struct PresentionModel {
        public var message: String?
        public var route: Route?
        public init() {
            
        }
    }
}
