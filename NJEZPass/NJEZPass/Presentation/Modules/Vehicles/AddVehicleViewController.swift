//
//  AddVehicleViewController.swift
//  NJEZPass
//
//  Created by Alam, Sk on 27/09/2019.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

class AddVehicleViewController:  UIViewController {
    
    private lazy var takeCameraAlert:UIAlertController! = {
        let alert = UIAlertController(title: "Take Photo", message: "Take a picture of the back of your vehicle, including the license plate.", preferredStyle:.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
     //   alert.addAction(UIAlertAction(title: "Continue", style: .cancel, handler: nil))
        return alert
    }()

    private lazy var takeCameraActionButton:UIAlertAction! = {
        
        let actionButton = UIAlertAction(title: "Continue", style: .default) { action in
            
            if let storyboard = self.storyboard {
                let vc = storyboard.instantiateViewController(withIdentifier: "UpdateAddressViewController") as! UpdateAddressViewController
                self.present(vc, animated: true, completion: nil)
            }
        }
        return actionButton
    }()
    
    private lazy var cancelActionButton:UIAlertAction! = {
        
        let actionButton = UIAlertAction(title: "Cancel", style: .default) { action in
            
        }
        return actionButton
    }()
    
    private lazy var skipCameraAlert:UIAlertController! = {
        let alert = UIAlertController(title: "Warning", message: "Are you sure you would like to skip adding a vehicle photo?", preferredStyle:.alert)
        return alert
    }()

    private lazy var yesForSkipAction:UIAlertAction! = {
        
        let actionButton = UIAlertAction(title: "Yes", style: .default) { action in
            if let storyboard = self.storyboard {
                let vc = storyboard.instantiateViewController(withIdentifier: "LicensePlateFlow") as! LicensePlateViewController
                self.present(vc, animated: true, completion: nil)
            }
        }
        return actionButton
    }()

    private lazy var noForSkipAction:UIAlertAction! = {
        
        let actionButton = UIAlertAction(title: "No", style: .default) { action in
            
        }
        return actionButton
    }()


    
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

extension AddVehicleViewController: UITableViewDelegate, UITableViewDataSource {
    
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
        return 92
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
            
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "\(CameraImageViewCell.self)", for: indexPath) as! CameraImageViewCell
                cell.delegate = self
                return cell
            
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "\(ContinueCell.self)", for: indexPath) as! ContinueCell
                cell.delegate = self
                return cell
            
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: "\(SkipCell.self)", for: indexPath) as! SkipCell
                cell.delegate = self
                return cell
            
            default:
                return UITableViewCell()
            
        }
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "\(VehicleCell.self)", for: indexPath) as! CameraImageViewCell
//        //set the cell display properties
//        cell.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
//        cell.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
//        cell.layer.shadowRadius = 3.0
//        cell.layer.shadowOpacity = 1.0
//        cell.layer.masksToBounds = false
//        return cell
    }
    
}

extension AddVehicleViewController: CameraImageViewCellDelegate {
    func cameraClicked() {
            self.present(takeCameraAlert, animated: true, completion: nil)
    }
}

extension AddVehicleViewController: ContinueCellDelegate {
    func continueClicked() {
        self.performSegue(withIdentifier: "LicensePlateFlow", sender: nil)
    }
}

extension AddVehicleViewController: SkipCellDelegate {
    func skipClicked() {
        
    }
}
