//
//  APIConstants.swift
//  CMAA
//
//  Created by Latha, Sowjanya on 15/04/19.
//  Copyright © 2019 cnd. All rights reserved.
//

import UIKit

public struct APIConstants {

    public enum  HostUrl {
        public static let prodUrl = "http://10.36.20.45:9084/vectorwsweb/account/home/viewController.do?json=true"
        public static let qaUrl = "http://10.36.20.45:9084/vectorwsweb/account/home/viewController.do?json=true"
        public static let devURL = "http://10.36.20.45:9084/vectorwsweb/account/home/viewController.do?json=true"
        public static let demoUrl = "http://10.36.20.45:9084/vectorwsweb/account/home/viewController.do?json=true"
        public static let local = "http://10.36.20.45:9084/vectorwsweb/account/home/viewController.do?json=true"
    }

    public enum ServiceNames {
        public static let loginUser = "loginUser"
        public static let authorizeUser = "authorizeUser"
        public static let accountOverview = "getAccountDetails"
        public static let profileUpdate = "api/account/holderinfo"
        public static let getPaymentMethods = "api/account/paymentmethods"
        public static let modifyBankAccount = "api/account/paymentmethod/primary"
        public static let modifyCreditCard = "api/account/paymentmethod/secondary"

    }

    public enum DefaultParams {
        public static let UUID: String = UIDevice.current.identifierForVendor!.uuidString
        public static let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
        public static let vendorID = "TEST123"
        public static let systemVersion = UIDevice.current.systemVersion
        public static let token = "ACSInrixTrafficApp"
        public static let deviceType = "IOS"
        public static let paymentTypeAll = "ALL"
        public static let mobile = "MOBILE"
        public static let afterLogin = "AFTER_LOGIN"
        public static let beforeLogin = "BEFORE_LOGIN"
    }

    public enum APIHeaderTypes {
        public static let contentTypeHeader = "Content-Type"
        public static let contentTypeJSON = "application/json; charset=utf-8"
        public static let contentTypeMultiPartImage = "multipart/form-data;"
        public static let acceptHeader = "Accept"
        public static let authorizationHeader = "Authorization"
        public static let qaHashKey = "LX6ZGwP3Uii+KCZxDxDWlDWijvNI6K/t2906cUzKYM4="
        public static let prodHashKey = "8U/k3RvTcMVSafJeS9NGpY4KDFdTLwpQ/GUc+lmPH/s="
    }

    public enum HTTPStrings {
        public static let contentTypeHeader = "Content-Type"
        public static let contentTypeJSON = "application/json"
        public static let contentTypeMultiPartImage = "multipart/form-data;"
        public static let acceptHeader = "Accept"
        public static let authorizationHeader = "Authorization"
        public static let qaHashKey = "LX6ZGwP3Uii+KCZxDxDWlDWijvNI6K/t2906cUzKYM4="
        public static let prodHashKey = "8U/k3RvTcMVSafJeS9NGpY4KDFdTLwpQ/GUc+lmPH/s="
    }

    public enum APIHostEnvironment {
        case qa
        case prod
        case dev
        case demo
        case local
    }
}
