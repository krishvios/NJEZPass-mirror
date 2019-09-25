//
//  QuestionsRouter.swift
//  NJEZPass
//
//  Created by Gudavarthi, Pardhu on 09/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
import Entities

class QuestionsRouter {
    var delegate: IRoutable?
    init(delegate: IRoutable) {
        self.delegate = delegate
    }
}

extension QuestionsRouter: IRouter {
    func perform(viewModel: Any) {
        //push viewcontroller
        if let viewModel = viewModel as? SecurityQuestionsModel.PresentionModel {
            
            if let route = viewModel.route {
                switch route.navigation {
                case .popup:
                    if let msg = viewModel.message {
                        delegate?.showMessage(message: msg)
                    }
                case .present:
                    if let msg = viewModel.message {
                        delegate?.showMessage(message: msg)
                    }
                case .push:
                                        push(route: route)
                }
            } else {
                if let msg = viewModel.message {
                    delegate?.showMessage(message: msg)
                }
            }
        } else if let viewModel = viewModel as? SecurityQuestionsModel.PresentionModel {
            if let route = viewModel.route {
                switch route.navigation {
                    
                case .present:
                    if let msg = viewModel.message {
                        delegate?.showMessage(message: msg)
                    }
                case .popup:
                    if let msg = viewModel.message {
                        delegate?.showMessage(message: msg)
                    }
                case .push: do {}
                }
            }
            else {
                if let msg = viewModel.message {
                    delegate?.showMessage(message: msg)
                }
            }
        }
    }
    func push(route: Route) {
        print("router: route: ", route.path)
        //push viewcontroller
    }
   
    func present(message: String) {
        delegate?.showMessage(message: message)
    }
    func pop() {
        //pop viewcontroller
        delegate?.popCurrent()
    }
    // MARK: Navigation
    func navigateToVC(destination: UIViewController) {
        if let viewController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController {
            viewController.pushViewController(destination, animated: true)
        }
        else {
            UIApplication.shared.keyWindow?.rootViewController?.show(destination, sender: nil)
        }
    }
}
