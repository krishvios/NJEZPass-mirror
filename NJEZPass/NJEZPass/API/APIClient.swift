//
//  APIClient.swift
//  NJEZPass
//
//  Created by Anshu Sharma on 28/07/19.
//  Copyright © 2019 Anshu Sharma. All rights reserved.
//

import Foundation
import Alamofire


class APIClient {
    static func login(email: String, password: String, completion:@escaping (Result<LoginAuth, Error>)->Void) {
        AF.request(APIRouter.login(email: email, password: password))
            .responseDecodable { (response: DataResponse<LoginAuth>) in
                completion(response.result)
        }
    }
}
