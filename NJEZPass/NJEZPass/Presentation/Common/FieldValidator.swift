//
//  FieldValidator.swift
//  CMAA
//
//  Created by Meera Mohan on 20/02/17.
//  Copyright © 2017 Benefit Wallet. All rights reserved.
//

import Foundation
import UIKit

class FieldValidator: NSObject {
    static let shared = FieldValidator()

    public func isValidString(stringToBeChecked: String, expression: String) -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: expression, options: NSRegularExpression.Options())
            if regex.firstMatch(in: stringToBeChecked, options: NSRegularExpression.MatchingOptions(), range: NSRange(location: 0, length: stringToBeChecked.count)) != nil {
                return true
            }
        } catch let err {
            print(err)
        }
        return false
    }

    public func isValidEmail(emailID: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: emailID)
    }

    public func isValidUserID (userIDString: String) -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: "^[0-9a-zA-Z\\_]{8,16}$", options: .caseInsensitive)
            if regex.matches(in: userIDString, options: [], range: NSRange(location: 0, length: userIDString.count)).count > 0 {
                if !(userIDString.hasPrefix("UP")) {
                return true
                }
            }
        } catch {}
        return false
    }
    func validateSSN(ssn: String) -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: "^[0-9\\_]{9}$", options: .caseInsensitive)
            if regex.matches(in: ssn, options: [], range: NSRange(location: 0, length: ssn.count)).count > 0 {
                return true
            }
        } catch {}
        return false
    }
    func isValidateDOB(date: String) -> Bool {

            return true
    }
    func isValidZipCode(value: String) -> Bool {
//        let regEx = "^[0-9]{5}(?:-[0-9]{4})?$" Commnted to remove hyphen from Zip code
        let regEx = "^[0-9]{5}(?:[0-9]{4})?$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regEx)
        return predicate.evaluate(with: value)
    }

    func isValidZipCodeFiveNumbers(value: String) -> Bool {
        if value.count == 5 {
            return true
        }
        return false
    }

    func isValidPhoneNumber(value: String) -> Bool {
        if value.count == 10 {
            return true
        } else {
            return false
        }
    }

    func isEmailAddressSame(emailAddress: String, confirmEmailAddress: String) -> Bool {
        if emailAddress == confirmEmailAddress {
            return true
        } else {
            return false
        }
    }

    func stringContainUpperCase(vlaue: String) -> Bool {
        let capitalLetterRegEx  = ".*[A-Z].*"
        let texttest = NSPredicate(format: "SELF MATCHES %@", capitalLetterRegEx)
        return texttest.evaluate(with: vlaue)
    }

    func stringContainLowerCase(vlaue: String) -> Bool {
        let capitalLetterRegEx  = ".*[a-z]+.*"
        let texttest = NSPredicate(format: "SELF MATCHES %@", capitalLetterRegEx)
        return texttest.evaluate(with: vlaue)
    }

    func stringContainNumber(vlaue: String) -> Bool {
        let capitalLetterRegEx  = ".*[0-9]+.*"
        let texttest = NSPredicate(format: "SELF MATCHES %@", capitalLetterRegEx)
        return texttest.evaluate(with: vlaue)
    }

  static func isValid(dobStr: String) -> Bool {
        var isValid = false
        let pattern = "^(1[0-2]|0[1-9])/(3[01]|[12][0-9]|0[1-9])/[0-9]{4}$"
        do {
            let regex = try NSRegularExpression(pattern: pattern, options: .caseInsensitive)
            let result = regex.matches(in: dobStr, options: [], range: NSRange(location: 0, length: dobStr.count))
            if result.count > 0 {
                print("Date is valid")
                isValid = true
            }

        } catch let error {
            print(error.localizedDescription)
        }
    return isValid
    }
}
