//
//  VehiclesViewController.swift
//  ezPass
//
//  Created by Gudavarthi, Pardhu on 18/07/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
import Entities
import MBProgressHUD

protocol IVehiclesViewable {
    func getVehiclesSuccess(viewModel: VehiclesListModel.PresentionModel)
    func getVehiclesFailed(viewModel: VehiclesListModel.PresentionModel)
    func searchVehicleswithPlateNoSuccess(viewModel: SearchVehiclesModel.PresentionModel)
    func searchVehicleswithPlateNoFailed(viewModel: SearchVehiclesModel.PresentionModel)
}

class VehiclesViewController: UIViewController {
    
    @IBOutlet weak var tbleView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Vehicles"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.barTintColor = .white
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}

extension VehiclesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        header.backgroundColor = UIColor.clear
        return header
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // let cell = tableView.dequeueReusableCell(withIdentifier: "\(VehicleCell.self)", for: indexPath) as! VehicleCell
        let cell : VehicleListTableViewCell = tableView.dequeueReusableCell(withIdentifier: "\(VehicleListTableViewCell.self)", for: indexPath) as! VehicleListTableViewCell

        
       // VehicleListTableViewCell
        //set the cell display properties
       // cell.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
       // cell.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
      //  cell.layer.shadowRadius = 3.0
      //  cell.layer.shadowOpacity = 1.0
       // cell.layer.masksToBounds = false
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "AddVehicle", sender: nil)
    }
    
}

extension VehiclesViewController: IVehiclesViewable {
    func getVehiclesSuccess(viewModel: VehiclesListModel.PresentionModel) {
        MBProgressHUD.hide(for: self.view, animated: true)

    }
    
    func getVehiclesFailed(viewModel: VehiclesListModel.PresentionModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
    func searchVehicleswithPlateNoSuccess(viewModel: SearchVehiclesModel.PresentionModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
    func searchVehicleswithPlateNoFailed(viewModel: SearchVehiclesModel.PresentionModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
}

extension VehiclesViewController: IRoutable {
    func showMessage(message: String) {
        DialogUtils.shared.displayDialog(title: Localizer.sharedInstance.localizedStringForKey(key: AppStringKeys.appName), message: Localizer.sharedInstance.localizedStringForKey(key: message), btnTitle: Localizer.sharedInstance.localizedStringForKey(key: AppStringKeys.ok), vc: self, accessibilityIdentifier: message)
    }
    
    func popCurrent() {
        // dismiss current viewcontroller like back action
    }
}
