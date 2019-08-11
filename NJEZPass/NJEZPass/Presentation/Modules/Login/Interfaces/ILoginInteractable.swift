//
//  ILoginInteractable.swift
//  CMAA
//
//  Created by Latha, Sowjanya on 04/06/19.
//  Copyright © 2019 conduent. All rights reserved.
//

import Foundation
import Domain
protocol ILoginInteractable {
    func login(username: String, password: String, requestType: Constants.RequestCategory)
    func getProfileOverview(accessToken: String, requestType: Constants.RequestCategory)
}
