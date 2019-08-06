//
//  LoginViewController.swift
//  NJEZPass
//
//  Created by Anshu Sharma on 22/07/19.
//  Copyright (c) 2019 Conduent. All rights reserved.
//


import UIKit

protocol LoginDisplayLogic: class
{
  func displayBiometricButton(viewModel: Login.Biometric.CheckBiometricModes.ViewModel)
}

class LoginViewController: UIViewController, LoginDisplayLogic
{
  var interactor: LoginBiometricLogic?
  var router: (NSObjectProtocol & LoginRoutingLogic & LoginDataPassing)?
    
    // MARK: IBOutlets
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var biometricAuthBtn: UIButton!
    
  // MARK: IBActions
    @IBAction func loginClicked(_ sender: Any) {
    }
    
    @IBAction func forgotPassClicked(_ sender: Any) {
    }
    
    
    @IBAction func biometricAuthBtnClicked(_ sender: Any) {
    }
    
    // MARK: Object lifecycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = LoginInteractor()
    let presenter = LoginPresenter()
    let router = LoginRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  
  // MARK: View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    checkForDeviceBiometricCapabilities()
  }
    
    override func viewWillAppear(_ animated: Bool) {
    }
  
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
  
  func checkForDeviceBiometricCapabilities()
  {
    let request = Login.Biometric.CheckBiometricModes.Request()
    interactor?.checkForDeviceBiometricCapabilities(request: request)
  }
  
    func displayBiometricButton(viewModel: Login.Biometric.CheckBiometricModes.ViewModel)
  {
    //nameTextField.text = viewModel.name
   /* switch viewModel.avilableMode {
    case AvailableBiometricMode.none:
        biometricAuthBtn.isHidden = true
    case AvailableBiometricMode.touchId:
        biometricAuthBtn.isHidden = false
        biometricAuthBtn.setTitle("Touch ID", for: .normal)
    case AvailableBiometricMode.faceId:
        biometricAuthBtn.isHidden = false
        biometricAuthBtn.setTitle("Face ID", for: .normal)

    } */
  }
}
