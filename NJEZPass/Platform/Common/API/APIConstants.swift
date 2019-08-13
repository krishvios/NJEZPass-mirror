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
        public static let prodUrl = "https://maas-test.services.conduent.com/"
        public static let qaUrl = "https://maas-test.services.conduent.com/"
        public static let devURL = "https://maas-test.services.conduent.com/"
        public static let demoUrl = "https://maas-test.services.conduent.com/"
        public static let local = "https://maas-test.services.conduent.com/"
    }

    public enum ServiceNames {
        public static let profileOverview = "bosuser/api/account/overview"
        public static let loginUser = "oauth/token"
    }

    public enum DefaultParams {
        public static let UUID: String = UIDevice.current.identifierForVendor!.uuidString
        public static let electronicTransfer = "ELECTRONIC_TRANSFER"
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
