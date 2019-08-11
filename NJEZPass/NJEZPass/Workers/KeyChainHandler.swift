//
//  KeyChainHandler.swift
//  NJEZPass
//
//  Created by Anshu Sharma on 11/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import Foundation

class KeyChainHandler {
    
    
    static func saveCredentialInKeyChainIfNeeded(_ request: Login.ApiAuthentication.Request){
        if !request.isSaveCredential {
            let biometricEnabled = UserDefaults.standard.bool(forKey: ConstantKeys.biometricLoginEnabled.rawValue)
                if !biometricEnabled {
                    deleteCredential()
                    return
                }
            
        }
        let userDefault = UserDefaults.standard
        userDefault.set(request.username, forKey: ConstantKeys.username.rawValue)
        userDefault.set(request.password, forKey: ConstantKeys.password.rawValue)
        userDefault.synchronize()

    }
    
    static func fetchCredentialFromKeyChain( completionHandler:@escaping(Login.ApiAuthentication.Request)-> Void) {
        let userDefault = UserDefaults.standard
        let user = userDefault.string(forKey: ConstantKeys.username.rawValue)
        let password = userDefault.string(forKey: ConstantKeys.password.rawValue)
        var req : Login.ApiAuthentication.Request
        if let username = user, let pass = password{
         req = Login.ApiAuthentication.Request(username: username, password: pass, isSaveCredential: true, isFirstTimeUser: false, loginMode: .biometric )
        }else{
            req = Login.ApiAuthentication.Request(username: "", password: "", isSaveCredential: true, isFirstTimeUser: false, loginMode: .biometric)
        }
        completionHandler(req)
        
    }
    
    static func saveSession(_ user:LoginAuth)
    {
        let defaults = UserDefaults.standard
        defaults.set(user.accessToken, forKey: ConstantKeys.accessToken.rawValue)
        defaults.set(user.refreshToken, forKey: ConstantKeys.refreshToken.rawValue)
        defaults.set(user.firstName, forKey: ConstantKeys.firstName.rawValue)
        defaults.set(user.lastName, forKey: ConstantKeys.lastName.rawValue)
        defaults.synchronize()
        
    }
    
    static func deleteSession(_ user:LoginAuth)
    {
        let userDefault = UserDefaults.standard
        userDefault.removeObject(forKey: ConstantKeys.accessToken.rawValue)
        userDefault.removeObject(forKey: ConstantKeys.refreshToken.rawValue)
        userDefault.removeObject(forKey: ConstantKeys.firstName.rawValue)
        userDefault.removeObject(forKey: ConstantKeys.lastName.rawValue)
        userDefault.synchronize()
        
    }

    
    static func deleteCredential(){
        let userDefault = UserDefaults.standard
        userDefault.removeObject(forKey: ConstantKeys.username.rawValue)
        userDefault.removeObject(forKey: ConstantKeys.password.rawValue)
        userDefault.synchronize()

    }
    
    static func isKeyPresentInUserDefaults(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }
}
