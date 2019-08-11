//
//  BiometricAuthWorker.swift
//  NJEZPass
//
//  Created by Anshu Sharma on 27/07/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import Foundation
import LocalAuthentication

protocol BioMetricAuthLogic {
    func checkAvailableBiometricMode() -> AvailableBiometricMode
    func performBiometricAuth(completionHandler: @escaping (Bool, String) -> Void)
//    func performFaceIdAuth(completionHandler: @escaping (Bool, String) -> Void)

}

extension LAContext {
    enum BiometricType: String {
        case none
        case touchID
        case faceID
    }
    
    var biometricType: BiometricType {
        var error: NSError?
        
        guard self.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) else {
            // Capture these recoverable error thru Crashlytics
            return .none
        }
        
        if #available(iOS 11.0, *) {
            switch self.biometryType {
            case .none:
                return .none
            case .touchID:
                return .touchID
            case .faceID:
                return .faceID
            @unknown default:
                return .none
            }
        } else {
            return  self.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) ? .touchID : .none
        }
    }
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
        return .touchId
    }
    
    func performBiometricAuth(completionHandler: @escaping (Bool, String) -> Void) {
        
        let reason = "Log in to your account"

        context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason ) { success, error in
            completionHandler(success, error?.localizedDescription ?? "Failed to authenticate")
        }

    }


}
