//
//  APIConfiguration.swift
//  NJEZPass
//
//  Created by Anshu Sharma on 28/07/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import Foundation
import Alamofire

protocol APIConfiguration: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
}
