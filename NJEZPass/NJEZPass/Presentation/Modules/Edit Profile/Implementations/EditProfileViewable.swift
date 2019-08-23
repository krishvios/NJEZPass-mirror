//
//  LoginViewController.swift
//  CMAA
//
//  Created by Vivek, Amirapu on 22/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
import Entities
import Domain
import Platform
import MBProgressHUD

extension EditProfileViewController: IEditProfileViewable {
    func updateProfileSuccess(viewModel: ProfileModel.PresentionModel) {
        let token:String = UserDefaults.standard.value(forKey: AppStringKeys.accessToken) as! String
//        interactor?.updateProfileOverview(accessToken: token, requestType: .remote)
    }
    
    func updateProfileFailed(viewModel: ProfileModel.PresentionModel) {
        var viewModel = viewModel
//        viewModel.route = Route(id: AppStringKeys.updateProfileFailure, path: AppUIElementKeys.editProfile, nextURL: "", navigation: NavigationInfo.present)
    }
    
    /*
    func editProfileSuccess(viewModel: ProfileModel.PresentationModel) {
//        progressActivity.stopAnimating()

        if rememberMe.isOn {

            self.saveCredentials()
        }
        
//        MBProgressHUD.hide(for: self.view, animated: true)
        let token:String = UserDefaults.standard.value(forKey: AppStringKeys.accessToken) as! String
        interactor?.getProfileOverview(accessToken: token, requestType: .remote)
//        router?.perform(viewModel: viewModel)
    }
    func editProfileFailed(viewModel: ProfileModel.PresentationModel) {
//        progressActivity.stopAnimating()
        MBProgressHUD.hide(for: self.view, animated: true)
        var viewModel = viewModel
        viewModel.route = Route(id: AppStringKeys.loginFailure, path: AppUIElementKeys.home, nextURL: "", navigation: NavigationInfo.present)
//        router?.perform(viewModel: viewModel)
    }
     */
    
    
//    func userProfileSuccess(viewModel: ProfileModel.PresentationModel) {
//        MBProgressHUD.hide(for: self.view, animated: true)
//
//        router?.perform(viewModel: viewModel)
//    }
//    func userProfileFailed(viewModel: ProfileModel.PresentationModel) {
//        MBProgressHUD.hide(for: self.view, animated: true)
//        router?.perform(viewModel: viewModel)
//    }
}
