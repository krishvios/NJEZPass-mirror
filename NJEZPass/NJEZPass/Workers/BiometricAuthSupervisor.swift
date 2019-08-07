//
//  BiometricAuthSupervisor.swift
//  NJEZPass
//
//  Created by Anshu Sharma on 02/08/19.
//  Copyright © 2019 Anshu Sharma. All rights reserved.
//

import Foundation

class BiometricAuthSupervisor: BioMetricAuthLogic {
    
    
    var worker : BioMetricAuthLogic
    
    init(worker : BioMetricAuthLogic)
    {
        self.worker = worker
    }
    
    
    func checkAvailableBiometricMode() -> AvailableBiometricMode {
        return worker.checkAvailableBiometricMode()
    }
    
    func performBiometricAuth(completionHandler: @escaping (Bool, String) -> Void) {
        worker.performBiometricAuth{ (success: Bool, error :String) in
            DispatchQueue.main.async {
                completionHandler(success, error)

            }
        }
    }

    
}
