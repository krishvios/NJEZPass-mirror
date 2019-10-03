//
//  LandingVC.swift
//  NJEZPass
//
//  Created by Muddika, Ramesh yadav on 20/09/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
import Entities
import Domain
import Platform
import Apollo_iOS
import MBProgressHUD
import KeychainAccess

protocol ILoginViewable {
    func loginSuccess(viewModel: AuthorizeModel.PresentionModel)
    func loginFailed(viewModel: AuthorizeModel.PresentionModel)
    func userProfileSuccess(viewModel: ProfileModel.PresentionModel)
    func userProfileFailed(viewModel: ProfileModel.PresentionModel)
    func registerPushSuccess(viewModel: PushModel.PresentionModel)
    func registerPushFailed(viewModel: PushModel.PresentionModel)
    func loadDynamicDataSuccess()
    func loadDynamicDataFailed()
}

class LandingVC:  UIViewController {
    
    @IBOutlet weak var touchIdDescriptionLbl: UILabel!
    @IBOutlet weak var fingerPrintSigninLbl: UILabel!
    @IBOutlet weak var tbleView: UITableView!
    var interactor: ILoginInteractable?
    var router: IRouter?
    @IBOutlet weak var fingerPrintOverlay: UIView!
    
    private var loginMethodcell:LoginMethodsTableViewCell?
    private var moreContentcell:MoreContentTableViewCell?
    private var tabWidgetCell:TabWidgetTableViewCell?
    private var gradientCell:GradientViewTableViewCell?
    
    lazy fileprivate var languageSelection: CMPickerView! = {
        let pickerView = CMPickerView(frame:CGRect(x: 0, y: self.tbleView.frame.size.height-150, width: self.view.frame.size.width, height: 150))
        pickerView.pickerArray = ["English","Spanish"]
        pickerView.viewDelegate = self
        return pickerView
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        let configurator = LoginConfigurator()
        configurator.build(viewController: self)
        interactor = configurator.interactor
        router = configurator.router
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
        fingerPrintOverlay.isHidden = true
        
        guard let _ = CMUtility.dynamicPageLoad else {
            MBProgressHUD.showAdded(to: self.view, animated: true)
            interactor?.loadDynamicData(action:APIConstants.ServiceNames.loadDynamicCache, requestType: .remote)
            return
        }
    }
    
    func setupTableView(){
        tbleView.estimatedRowHeight = 2
        tbleView.rowHeight = UITableView.automaticDimension
        tbleView.keyboardDismissMode = .onDrag
        tbleView.bounces = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        
    }
    
    @IBAction func cancelFingerPrint(_ sender: Any) {
        fingerPrintOverlay.isHidden = true
    }
}

extension LandingVC: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 172
        }
        if indexPath.row == 1{
            return 347
        }
        if indexPath.row == 2 {
            return 222
        }
        
        if indexPath.row == 3 {
            return 230
        }
        if indexPath.row == 4{
            return 85
        }
        return 355
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cellIdentifier = ""
        
        switch indexPath.row {
            
        case 0:
            cellIdentifier = "LoginBackGround"
            gradientCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? GradientViewTableViewCell
            gradientCell?.gradientDelegate = self
            return gradientCell!
        case 1:
            cellIdentifier = "LoginMethods"
            
            loginMethodcell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? LoginMethodsTableViewCell
            loginMethodcell?.loginDelegate = self
            return loginMethodcell!
            
        case 2:
            cellIdentifier = "MoreContents"
            moreContentcell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? MoreContentTableViewCell
            moreContentcell?.moreContentsDelegate = self
            return moreContentcell!
        case 4:
            cellIdentifier = "Widget"
            tabWidgetCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? TabWidgetTableViewCell
            tabWidgetCell?.tabWidgetDelegate = self
            return tabWidgetCell!
        default:
            cellIdentifier = "NewsRoom"
            
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        
        return cell!
    }
}

extension LandingVC: LoginMethodsCellDelegate {
    
    func loginClicked(username: String?, password: String?) {
        
        self.view.endEditing(true)
        self.resignFirstResponder()
        
        //online login flow
        MBProgressHUD.showAdded(to: self.view, animated: true)
        interactor?.login(username: username!, password: password!, requestType: .remote)
        
//        direct login flow in case of api error
//        var viewModel = ProfileModel.PresentionModel()
//        viewModel.route = Route(id: AppStringKeys.loginSuccess, path: AppUIElementKeys.home, nextURL: "", navigation: NavigationInfo.push)
//        router?.perform(viewModel: viewModel)
    }
    
//    func loginClicked(_ sender: Any) {
//        self.performSegue(withIdentifier: "showDashboard", sender: self)
//    }
    
    @IBAction func languageSelectionClick(_ sender: Any) {
        
    }
    
    func signinClicked(_ sender: Any) {
        guard let url = URL(string: "http://www.google.com") else {
            return
        }
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
    func forgotPasswordClicked(_ sender: Any) {
        
    }
    
    func forgotUserNameCllicked(_ sender: Any) {
        
    }
    
    func fingerPrintClicked(_ sender: Any) {
       
        fingerPrintOverlay.isHidden = false
    }
}

extension LandingVC: MoreContentCellDelegate {
    func payViolationorTollBillClicked(_ sender: Any) {
        
    }
    func registerAccountClicked(_ sender: Any) {
        guard let url = URL(string: "http://www.google.com") else {
            return
        }
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
}

extension LandingVC: TabWidgetCelldelegate {
    
    func tollFacilitesClicked(_ sender: Any) {
        guard let url = URL(string: "http://www.google.com") else {
            return
        }
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
    func travelToolsClicked(_ sender: Any) {
        guard let url = URL(string: "http://www.google.com") else {
            return
        }
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
    func websiteClicked(_ sender: Any) {
        guard let url = URL(string: "http://www.google.com") else {
            return
        }
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
}



extension LandingVC: ILoginViewable {
    func registerPushSuccess(viewModel: PushModel.PresentionModel) {
        
         interactor?.getProfileOverview(action: APIConstants.ServiceNames.accountOverview, requestType: .remote)
    }
    
    func registerPushFailed(viewModel: PushModel.PresentionModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
    func loginSuccess(viewModel: AuthorizeModel.PresentionModel) {
       
        interactor?.registerForPushService(action: APIConstants.ServiceNames.pushService, requestType: .remote)
    }
    
    func loginFailed(viewModel: AuthorizeModel.PresentionModel) {
        //        progressActivity.stopAnimating()
        MBProgressHUD.hide(for: self.view, animated: true)
        var viewModel = viewModel
        viewModel.route = Route(id: AppStringKeys.loginFailure, path: AppUIElementKeys.home, nextURL: "", navigation: NavigationInfo.present)
        router?.perform(viewModel: viewModel)
    }
    
    func userProfileSuccess(viewModel: ProfileModel.PresentionModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
        
        router?.perform(viewModel: viewModel)
    }
    
    func userProfileFailed(viewModel: ProfileModel.PresentionModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
        router?.perform(viewModel: viewModel)
    }
    
    func loadDynamicDataSuccess() {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
    func loadDynamicDataFailed() {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
}

extension LandingVC: IRoutable {
    func showMessage(message: String) {
        DialogUtils.shared.displayDialog(title: Localizer.sharedInstance.localizedStringForKey(key: AppStringKeys.appName), message: Localizer.sharedInstance.localizedStringForKey(key: message), btnTitle: Localizer.sharedInstance.localizedStringForKey(key: AppStringKeys.ok), vc: self, accessibilityIdentifier: message)
    }
    
    func popCurrent() {
        // dismiss current viewcontroller like back action
    }
}

extension LandingVC:GradientDelegateCell {
    func localizationSelect(_sender: Any) {
        //   self.view.addSubview(languageSelection)
        if view.subviews.contains(self.languageSelection){
            self.languageSelection.isHidden = false
        } else {
            self.view.addSubview(languageSelection)
        }
    }
}

extension LandingVC:CMPickerViewDelegate {
    func doneClicked(selectedString: String) {
        print("selectedString = \(selectedString)")
        
        self.languageSelection.isHidden = true
    }
    
    func cancelClicked() {
        self.languageSelection.isHidden = true
    }
}
