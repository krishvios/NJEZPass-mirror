//
//  IEditProfileInteractable.swift
//  CMAA
//
//  Created by Vivek, Amirapu on 22/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import Foundation
import Domain
protocol IEditProfileInteractable {
    func updateProfileOverview(accessToken: String, requestType: Constants.RequestCategory)
}
