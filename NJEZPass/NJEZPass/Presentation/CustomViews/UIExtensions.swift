//
//  UIExtensions.swift
//  CMAA
//
//  Created by Latha, Sowjanya on 15/04/19.
//  Copyright © 2019 cnd. All rights reserved.
//

import UIKit

enum BorderPosition: String {
    case top = "Top"
    case bottom = "Bottom"
    case left = "Left"
    case right = "Right"
}

enum ButtonImgPosition: String {
    case top = "Top"
    case bottom = "Bottom"
    case left = "Left"
    case right = "Right"
}

extension UITextField {
    func loadDropdownData(data: [String]) {
        self.inputView = DropDownPickerView(pickerData: data, dropdownField: self)//DropDownTblView(dropDownData: data, dropdownField: self)//MyPickerView(pickerData: data, dropdownField: self)
        self.inputView?.backgroundColor = .red
    }
}

extension UIColor {
    struct BWColorCodes {
        static let appThemeBlue = UIColor.init(red: 45.0/255.0, green: 68.0/255.0, blue: 96.0/255.0, alpha: 1)
    }
}

extension UIButton {

}

protocol Reusable {
    static var reuseID: String {get}
}

extension Reusable {
    static var reuseID: String {
        return String(describing: self)
    }
}

extension UITableViewCell: Reusable {}

extension UIViewController: Reusable {}

extension UITableView {
    func dequeueReusableCell<T>(ofType cellType: T.Type = T.self, at indexPath: IndexPath) -> T where T: UITableViewCell {
        guard let cell = dequeueReusableCell(withIdentifier: cellType.reuseID,
                                             for: indexPath) as? T else {
                                                fatalError()
        }
        return cell
    }
}

extension UIStoryboard {
    func instantiateViewController<T>(ofType type: T.Type = T.self) -> T where T: UIViewController {
        guard let viewController = instantiateViewController(withIdentifier: type.reuseID) as? T else {
            fatalError()
        }
        return viewController
    }
    func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
}
