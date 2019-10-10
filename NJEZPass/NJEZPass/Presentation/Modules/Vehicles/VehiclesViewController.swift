//
//  VehiclesViewController.swift
//  ezPass
//
//  Created by Gudavarthi, Pardhu on 18/07/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
import Entities
import Domain
import Platform
import MBProgressHUD

protocol IVehiclesViewable {
    func getVehiclesSuccess(viewModel: VehiclesListModel.PresentionModel)
    func getVehiclesFailed(viewModel: VehiclesListModel.PresentionModel)
    func searchVehicleswithPlateNoSuccess(viewModel: SearchVehiclesModel.PresentionModel)
    func searchVehicleswithPlateNoFailed(viewModel: SearchVehiclesModel.PresentionModel)
}

class VehiclesViewController: UIViewController {
    
    @IBOutlet weak var tbleView: UITableView!
    @IBOutlet weak var searchBar: SearchBarCustom!
    var searchActive : Bool = false

    @IBOutlet weak var btnAddVehicle: UIButton!
    var interactor: IVehiclesInteractable?
    var router: IRouter?

    var buttontapped = 1
    var data = ["02210005166","0221000514"]
    var vehicleData : [Any] = []
//    var filtered:[String] = []
    var filtered:[String] = []
    var vehicleList : VehiclesListModel.VehicleList?
    var vehicleListCount = 0
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
       super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
       setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
       setup()
    }

    private func setup() {
       let configurator = VehiclesConfigurator()
       configurator.build(viewController: self)
       interactor = configurator.interactor
       router = configurator.router
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Vehicles"
        self.setupSearchBarUI()

        MBProgressHUD.showAdded(to: self.view, animated: true)
        interactor?.getVechiclesList(action: APIConstants.ServiceNames.getVechiclesService, requestType: .remote)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.barTintColor = .white
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    func setupSearchBarUI(){
        searchBar.preferredFont = UIFont.systemFont(ofSize: 14)
        searchBar.preferredTextColor = UIColor.gray
        searchBar.searchTextPositionAdjustment = UIOffset(horizontal: 10, vertical: 0)
        searchBar.delegate = self
    }
    
    @IBAction func btnAddVehicleTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: "AddVehicle", sender: nil)

    }
    
}

/*
extension TagsViewController :UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cellIdentifier = "ActivityCell"
        switch indexPath.row {
        case transponderListCount :
            cellIdentifier = "RequestTagCell"
            let cell: RequestTagsorTagSuppliesCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! RequestTagsorTagSuppliesCell
            cell.delegate = self
            return cell
        case transponderListCount + 1 :
            cellIdentifier = "RequestTagSupplies"
            let cell: RequestTagsorTagSuppliesCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! RequestTagsorTagSuppliesCell
            cell.delegate = self
            return cell
        default:
            
            if(searchActive){
            let cell : AccountActivityCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! AccountActivityCell
            cell.moreButtonAction.isHidden = false
            cell.statusColor.isHidden = true
            cell.activityTime.isHidden = true
            let trasponderListDic = tagData[0] as! Entities.TagsModel.Transponder
                cell.accountDetailsorTagDetails.text = trasponderListDic.mountType
                cell.accountDetailsorTagDetails.textColor =  colorLiteral(red: 0.3333333333, green: 0.3568627451, blue: 0.3529411765, alpha: 1)
                cell.activityType.text =  trasponderListDic.transponderNo
                cell.Activity.text = trasponderListDic.status
            cell.delegate = self
            
            if cell.Activity.text == "Active" {
                cell.StatusView.clipsToBounds = true
                cell.StatusView.borderWidth = 0.5
                cell.StatusView.borderColor =  colorLiteral(red: 0, green: 0.7058823529, blue: 0.6274509804, alpha: 1)
                cell.Activity.textColor =  colorLiteral(red: 0, green: 0.7058823529, blue: 0.6274509804, alpha: 1)
            }
            else {
                cell.Activity.textColor =  colorLiteral(red: 0.6666666667, green: 0.6862745098, blue: 0.7254901961, alpha: 1)
            }
             return cell
            } else {
                let cell : AccountActivityCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! AccountActivityCell
                cell.moreButtonAction.isHidden = false
                cell.statusColor.isHidden = true
                cell.activityTime.isHidden = true
                let trasponderListDic = tagData[0] as! Entities.TagsModel.Transponder
                cell.accountDetailsorTagDetails.text = trasponderListDic.mountType
                cell.accountDetailsorTagDetails.textColor =  colorLiteral(red: 0.3333333333, green: 0.3568627451, blue: 0.3529411765, alpha: 1)
                cell.activityType.text =  trasponderListDic.transponderNo
                cell.Activity.text = trasponderListDic.status
                cell.delegate = self
    
                if trasponderListDic.status == "Active" {
                    cell.StatusView.clipsToBounds = true
                    cell.StatusView.borderWidth = 0.5
                    cell.StatusView.borderColor =  colorLiteral(red: 0, green: 0.7058823529, blue: 0.6274509804, alpha: 1)
                    cell.Activity.textColor =  colorLiteral(red: 0, green: 0.7058823529, blue: 0.6274509804, alpha: 1)
                }
                else {
                    cell.Activity.textColor =  colorLiteral(red: 0.6666666667, green: 0.6862745098, blue: 0.7254901961, alpha: 1)
                }
                return cell
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(searchActive) {
            return filtered.count
        }
        if transponderList != nil
        {
            return transponderListCount + 2
        }
        return transponderListCount
    }
}
*/

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
        
        if(searchActive) {
            return filtered.count
        }
        if vehicleList != nil
        {
            return vehicleListCount
        }
        return vehicleListCount
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell!
        
        if vehicleList == nil {
            cell = tableView.dequeueReusableCell(withIdentifier: "\(VehicleCell.self)", for: indexPath) as! VehicleCell

        } else{
            cell  = tableView.dequeueReusableCell(withIdentifier: "\(VehicleListTableViewCell.self)", for: indexPath) as! VehicleListTableViewCell
            
            var vehicleListCell = cell as? VehicleListTableViewCell
            
            let vehicleInfo = vehicleList?.vehicle![indexPath.row]
            vehicleListCell?.configureVehicleDetails(name: "\(vehicleInfo!.make!) \(vehicleInfo!.model!)" , number: vehicleInfo!.plateNumber!)
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        if vehicleList != nil
        {
            self.performSegue(withIdentifier: "EditVehicle", sender: nil)
        }
        else
        {
            self.performSegue(withIdentifier: "AddVehicle", sender: nil)
        }
    }
    
}

extension VehiclesViewController: IVehiclesViewable {
    func getVehiclesSuccess(viewModel: VehiclesListModel.PresentionModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
        vehicleList = viewModel.vehicleList
        vehicleListCount = Int(vehicleList!.count!) ?? 0
        vehicleData = vehicleList?.vehicle ?? []
        tbleView.reloadData()
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


extension VehiclesViewController : UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true;
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
//        filtered
//        filtered = data.filter({ (text) -> Bool in
//            let tmp: String = text
//            return tmp.contains(searchText)
//        })
//        if(filtered.count == 0){
//            searchActive = false;
//        } else {
//            searchActive = true;
//        }
        self.tbleView.reloadData()
    }
}
