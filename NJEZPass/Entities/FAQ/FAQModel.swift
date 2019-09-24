//
//  FAQModel.swift
//  Entities
//
//  Created by Amirapu, Vivek (External) on 13/09/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import Foundation

public enum FAQModel {
    
    public struct Request: Codable {
        public var action, urlId, language: String?
    }
    
    public struct Response: Codable {
        public var staticPageLoad, statusCode, errorMessage: String?
        public var route: Route?
    }
    
    public struct PresentationModel {
        public var message: String?
        public var route: Route?
    }
    
}
