//
//  EditVehicleDeatilsViewController.swift
//  NJEZPass
//
//  Created by Alam, Sk on 10/10/2019.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

class EditVehicleDeatilsViewController: UIViewController {
    @IBOutlet weak var tbleView: UITableView!
    var navtitle:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = navtitle ?? "Vehicle Details"
        // Do any additional setup after loading the view.
    }
    @IBAction func backbuttonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension EditVehicleDeatilsViewController: UITableViewDelegate, UITableViewDataSource {
    
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
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 227
        }
        else if indexPath.row == 1 {
            
            return 272
        }
        
        return   478
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell?
        
        switch indexPath.row {
        case 0:
            if let cameraImageViewCell = tableView.dequeueReusableCell(withIdentifier: "\(CameraImageViewCell.self)") as? CameraImageViewCell {
                cell = cameraImageViewCell
            }
        case 1:
            if let licensePlateCell = tableView.dequeueReusableCell(withIdentifier: "\(LicensePlateTableViewCell.self)") as? LicensePlateTableViewCell {
                cell = licensePlateCell
            }
        case 2:
            if let vehicleMakeCell = tableView.dequeueReusableCell(withIdentifier: "\(VehicleMakeCell.self)") as? VehicleMakeCell {
                // countryCell.delegate = self
                cell = vehicleMakeCell
            }
       
        default:
            return cell ?? UITableViewCell()
        }
        
        return cell ?? UITableViewCell()
        
        
        
    }
}
