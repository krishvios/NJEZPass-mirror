//
//  PlatformUtility.swift
//  Platform
//
//  Created by Gudavarthi, Pardhu on 17/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import Foundation

public struct PlatformUtility {
    
    public static var session_id : String? = nil
    public static func getSessionId() ->String?{
        return session_id
    }
}

