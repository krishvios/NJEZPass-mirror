//
//  BiometricAuthWorker.swift
//  NJEZPass
//
//  Created by Anshu Sharma on 27/07/19.
//  Copyright © 2019 Anshu Sharma. All rights reserved.
//

import Foundation
import LocalAuthentication

protocol BioMetricAuthLogic {
    func checkAvailableBiometricMode() -> AvailableBiometricMode
    func performBiometricAuth(completionHandler: @escaping (Bool, String) -> Void)
//    func performFaceIdAuth(completionHandler: @escaping (Bool, String) -> Void)

}


class BiometricAuthWorker :BioMetricAuthLogic{
    
    let context = LAContext()
    static let sharedInstance = BiometricAuthWorker()
    
    
    
    func checkAvailableBiometricMode() -> AvailableBiometricMode{
        var error: NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            if (context.biometryType != .faceID){
                return .touchId
            }else{
                return .faceId
            }

        }
        else{
        return .none
        }
    }
    
    func performBiometricAuth(completionHandler: @escaping (Bool, String) -> Void) {
        
        let reason = "Log in to your account"

        context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason ) { success, error in
            completionHandler(success, error?.localizedDescription ?? "Failed to authenticate")
        }

    }


}
