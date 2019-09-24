//
//  CMUtility.swift
//  NJEZPass
//
//  Created by Gudavarthi, Pardhu on 24/09/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import Foundation
import Entities

public struct CMUtility {
    
    public static var dynamicPageLoad: DynamicCacheModel.DynamicPageLoad?
    
    public static var nixieFlag: String?
    public static var suggestedAmount: String?
    public static var firstTimeLogin: String?
    
    public static func getDropdownData() ->DynamicCacheModel.DynamicPageLoad?{
        return dynamicPageLoad
    }

}
