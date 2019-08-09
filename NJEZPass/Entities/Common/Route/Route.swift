//
//  Common.swift
//  CMAA
//
//  Created by Latha, Sowjanya on 24/05/19.
//  Copyright © 2019 cnd. All rights reserved.
//

import Foundation

public enum NavigationInfo: String, Codable {
    case push = "PUSH"
    case present = "PRESENT"
    case popup = "POPUP"
}
public struct Route: Codable {
    public var id: String
    public var path: String
    public var nextURL: String?
    public var navigation: NavigationInfo
    public init(id: String = "", path: String = "", nextURL: String?, navigation: NavigationInfo = .popup) {
        self.id = id
        self.path = path
        self.nextURL = nextURL
        self.navigation = navigation
    }
}
