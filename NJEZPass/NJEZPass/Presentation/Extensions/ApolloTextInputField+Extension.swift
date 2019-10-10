//
//  ApolloTextInputField+Extension.swift
//  MobileWallet
//
//  Created by Jaiswal, Akash on 21/07/19.
//  Copyright © 2019 conduent. All rights reserved.
//

import Foundation
import Apollo_iOS

extension ApolloTextInputField {
    func configureTheme(type: LAWTextFieldValidationType, forView: ApolloTextInputFieldDelegate?, placeholderText: String, returnkey: UIReturnKeyType = .continue, keyboardType: Int = 1, validationFormat: String = "", textColor: UIColor = UIColor.black) {
        validationType = type
        if validationType == .password || validationType == .ssn {
            secureTextEntry = true
        }
        self.delegate = forView
        errorTextSize = 10
        errorTextColor = Theme.TextColor.error
        successTextSize = 10
        successTextColor = Theme.TextColor.success
        warningTextSize = 10
        warningTextColor = Theme.TextColor.warning
        textSize = 14
        self.textColor = textColor
        titleColor = Theme.TextColor.darkGray
        separatorFilledColor = Theme.TextColor.darkGray
        separatorDefaultColor = Theme.TextColor.darkGray
        placeholder = placeholderText
        self.setFormatting(formattingPattern: validationFormat, replacementChar: "*")
        self.keyboardType = keyboardType
        placeholderColor = Theme.TextColor.gray
        returnKeyType = returnkey
    }
}
