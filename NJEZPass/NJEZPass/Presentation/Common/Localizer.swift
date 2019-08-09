//
//  Localizer.swift
//  CMAA
//
//  Created by developer on 10/02/17.
//  Copyright © 2017 developer. All rights reserved.
//

import Foundation

class Localizer {
     var myBundle: Bundle?
     class var sharedInstance: Localizer {
        struct Static {
            static let instance: Localizer = Localizer()
        }
        return Static.instance
    }
    init() {
            // use systems main bundle as default bundle
            myBundle = Bundle.main
    }
    func localizedStringForKey(key: String) -> String {
        return myBundle?.localizedString(forKey: key as String, value: "", table: "Localization") ?? ""
    }
}
