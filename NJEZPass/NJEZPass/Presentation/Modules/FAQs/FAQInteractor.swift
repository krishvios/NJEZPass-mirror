//
//  FAQInteractor.swift
//  NJEZPass
//
//  Created by Amirapu, Vivek (External) on 12/09/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import Foundation
import UIKit
import Entities
import Domain
import Platform

protocol IFAQInteractable {
    func updateProfileOverview(accessToken: String, requestType: Constants.RequestCategory)
}

class FAQInteractor {
    var presenter: IResponseHandler?
    var userProfileUsecaseProvider = UserProfileUsecaseProvider()
}

//extension FAQInteractor: IFAQInteractable {
//    func getFAQ(accessToken: String, requestType: Constants.RequestCategory) {
//
//    }
//}
