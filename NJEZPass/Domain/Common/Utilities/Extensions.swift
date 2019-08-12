//
//  Extensions.swift
//  CMAA
//
//  Created by Latha, Sowjanya on 02/05/19.
//  Copyright © 2019 cnd. All rights reserved.
//

import Foundation

extension Data {
   public mutating func append(string: String, using encoding: String.Encoding = .utf8) {
        if let data = string.data(using: encoding) {
            append(data)
        }
    }
}
