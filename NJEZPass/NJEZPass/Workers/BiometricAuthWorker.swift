//
//  BiometricAuthWorker.swift
//  NJEZPass
//
//  Created by Anshu Sharma on 27/07/19.
//  Copyright © 2019 Anshu Sharma. All rights reserved.
//

import Foundation

protocol BioMetricAuthLogic {
    func checkAvailableBiometricMode() -> AvailableBiometricMode
    func performTouchIdAuth() -> Login.Biometric.Authentication.Response
    func performFaceIdAuth() -> Login.Biometric.Authentication.Response

}

class BiometricAuthWorker :BioMetricAuthLogic{
    
    static let sharedInstance = BiometricAuthWorker()
    func checkAvailableBiometricMode() -> AvailableBiometricMode{
        return AvailableBiometricMode.faceId
    }
    func performTouchIdAuth() -> Login.Biometric.Authentication.Response{
        return Login.Biometric.Authentication.Response (success: true, errorMsg: "")
    }
    func performFaceIdAuth() -> Login.Biometric.Authentication.Response{
        return Login.Biometric.Authentication.Response (success: true, errorMsg: "")

    }

}
