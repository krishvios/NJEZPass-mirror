//
//  AppStringKeys.swift
//  CMAA
//
//  Created by Latha, Sowjanya on 01/06/19.
//  Copyright © 2019 conduent. All rights reserved.
//

import Foundation

enum AppStringKeys {
    static let appName = "APP_NAME"
    static let loginSuccess = "LOGIN_SUCCESS"
    static let loginFailure = "LOGIN_FAILURE"
    static let invalidUserDetails = "INVALID_USER_DETAILS"
    static let invalidEmailDetails = "INVALID_EMAIL_DETAILS"
    static let ok = "OK"
    static let versionString = "VERSION_STRING_VALUE"
    static let accessToken = "AccessToken"
}
enum AppGraphicKeys {
    static let checkboxChecked = "checkbox-checked"
    static let checkboxUnChecked = "checkbox-unchecked"
}
enum AppRegExKeys {
    static let password = "^[0-9a-zA-Z\\_@]{6,16}$"
    static let accountNo = "^[a-zA-Z]$"
}
enum AppUIElementKeys {
    static let login = "LoginViewController"
    static let home = "TabBarViewController"
    static let deviceVerification = "DeviceVerificationVC"
}

enum AppKey{
    static let quesKey = "ques"
    static let ansKey = "ans"
}
