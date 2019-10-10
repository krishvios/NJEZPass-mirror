//
//  ColorThemes.swift
//  MobileWallet
//
//  Created by Pandey, Laxman prasad on 03/06/19.
//  Copyright © 2019 Pandey, Laxman prasad. All rights reserved.
//

import Foundation
import UIKit

enum Theme {
    enum BackGroundColor {
        static let primaryBtn = UIColor(red: 32.0/255.0, green: 68.0/255.0, blue: 99.0/255.0, alpha: 1)
        static let secondaryBtn = UIColor.white
        static let HSA = UIColor(red: 0.0/255.0, green: 71.0/255.0, blue: 186.0/255.0, alpha: 1)
        static let FSA = UIColor(red: 60.0/255.0, green: 0.0/255.0, blue: 110.0/255.0, alpha: 1)
        static let DCFSA = UIColor(red: 0.0/255.0, green: 90.0/255.0, blue: 100.0/255.0, alpha: 1)
        static let HRA = UIColor(red: 0.0/255.0, green: 131.0/255.0, blue: 123.0/255.0, alpha: 1)
        static let HIA = UIColor(red: 39.0/255.0, green: 68.0/255.0, blue: 99.0/255.0, alpha: 1)
        static let stepProgressBarWaiting = UIColor(red: 219/255.0, green: 221.0/255.0, blue: 220.0/255.0, alpha: 1)
        static let stepProgressBarComplete = UIColor(red: 255/255.0, green: 135.0/255.0, blue: 0.0/255.0, alpha: 1)
    }
    enum Font {
        static let semiBold12 = UIFont(name: "OpenSans-Semibold", size: 12.0)!
        static let semiBold13 = UIFont(name: "OpenSans-Semibold", size: 13.0)!
        static let semiBold20 = UIFont(name: "OpenSans-Semibold", size: 20.0)!
        static let normal18 = UIFont(name: "OpenSans", size: 18.0)!
        static let normal14 = UIFont(name: "OpenSans", size: 14.0)!
        static let normal13 = UIFont(name: "OpenSans", size: 13.0)!
        static let normal12 = UIFont(name: "OpenSans", size: 12.0)!
        static let normal11 = UIFont(name: "OpenSans", size: 11.0)!
        static let normal10 = UIFont(name: "OpenSans", size: 10.0)!
        static let semiBold14 = UIFont(name: "OpenSans-Semibold", size: 14.0)!
        static let bold18 = UIFont(name: "OpenSans-Bold", size: 18.0)!
        static let bold14 = UIFont(name: "OpenSans-Bold", size: 14.0)!
        static let bold12 = UIFont(name: "OpenSans-Bold", size: 12.0)!
        static let lighItalic14 = UIFont(name: "OpenSansLight-Italic", size: 14.0)!
        static let lighItalic13 = UIFont(name: "OpenSansLight-Italic", size: 13.0)!
        static let lighItalic24 = UIFont(name: "OpenSansLight-Italic", size: 24.0)!
        static let semiBold16 = UIFont(name: "OpenSans-Semibold", size: 16.0)!
        static let normal16 = UIFont(name: "OpenSans", size: 16.0)!

        static let themeBtn = semiBold12
        static let conclusion = semiBold20
        static let messageSubTitle = normal14
        static let message = semiBold16
        static let title = normal16
        static let instructionText = normal14
    }

    enum TextColor {
        static let blueBottomBorder = UIColor(red: 5.0/255.0, green: 101.0/255.0, blue: 255.0/255.0, alpha: 1)
        static let white = UIColor.white
        static let black = UIColor.black
        static let gray = UIColor(red: 85.0/255.0, green: 91.0/255.0, blue: 90.0/255.0, alpha: 1)
        static let lightGray = UIColor.lightGray
        static let apolloGray = UIColor(red: 116.0/255.0, green: 118.0/255.0, blue: 118.0/255.0, alpha: 1)
        static let primaryBtn = white
        static let secondaryBtn = UIColor(red: 32.0/255.0, green: 68.0/255.0, blue: 99.0/255.0, alpha: 1)
        static let conclusion = black
        static let messageSubTitle = apolloGray
        static let message = black
        static let title = black
        static let instructionText = black
        static let green = UIColor(red: 0/255.0, green: 180.0/255.0, blue: 160.0/255.0, alpha: 1)
        static let success = green
        static let red = UIColor(red: 201/255.0, green: 37.0/255.0, blue: 0.0/255.0, alpha: 1)
        static let error = red
        static let orange = UIColor(red: 255/255.0, green: 135.0/255.0, blue: 0.0/255.0, alpha: 1)
        static let warning = orange
        static let blue = UIColor(red: 0/255.0, green: 71/255.0, blue: 186/255.0, alpha: 1)
        static let apolloBlue = blue
        static let darkGray = UIColor(red: 85/255.0, green: 91.0/255.0, blue: 90.0/255.0, alpha: 1)
       }
}
