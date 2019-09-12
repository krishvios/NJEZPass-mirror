//
//  LoginTableViewDesignViewController.swift
//  NJEZPass
//
//  Created by Muddika, Ramesh yadav on 09/09/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
import Entities
import Domain
import Platform
import Apollo_iOS
import MBProgressHUD
import KeychainAccess


class LoginTableViewDesignViewController:  UIViewController, UITableViewDelegate, UITableViewDataSource,LoginMethodsCellDelegate,NewsRoomTableCellDelegate {
    
    
   
    @IBOutlet weak var tbleView: UITableView!
    
    var interactor: ILoginInteractable?
    var router: IRouter?
    private var loginMethodcell:LoginMethodsTableViewCell?
    private var newsRoomMethodcell:NewsRoomTableViewCell?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupTableView()
    }
    
    func setupTableView(){
        //        let nib = UINib(nibName: String(describing: ButtonTableViewCell.self), bundle: nil)
        //        tbleView.register(nib, forCellReuseIdentifier: String(describing: ButtonTableViewCell.self))
        tbleView.estimatedRowHeight = 100
        tbleView.rowHeight = UITableView.automaticDimension
        tbleView.keyboardDismissMode = .onDrag
        
       
        
    }
    
    override func viewDidLayoutSubviews() {
        self.tbleView.contentInset = UIEdgeInsets(top: -UIApplication.shared.statusBarFrame.size.height, left: 0, bottom: 0, right: 0)
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
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
        
        if indexPath.row == 2 {
            return 205
        }
        
        if indexPath.row == 3 {
            return 248
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
        case 1:
            cellIdentifier = "LoginMethods"
            
            loginMethodcell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? LoginMethodsTableViewCell
            loginMethodcell?.loginDelegate = self
            return loginMethodcell!
            
        case 2:
            cellIdentifier = "MoreContents"
        case 4:
            cellIdentifier = "Widget"
        default:
            cellIdentifier = "NewsRoom"
            newsRoomMethodcell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? NewsRoomTableViewCell
            newsRoomMethodcell?.newsRoomDelegate = self
            return newsRoomMethodcell!
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        
        return cell!
    }
    
    //Login delegate methods
    func loginClicked(_ sender: Any) {
        
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
        guard let url = URL(string: "http://www.google.com") else {
            return
        }
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
    func forgotUserNameCllicked(_ sender: Any) {
        guard let url = URL(string: "http://www.google.com") else {
            return
        }
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
    //Newsroom delegate methods
    var newsRoomDelegateVar: NewsRoomViewController? {
        didSet {
            newsRoomDelegateVar?.newsRoomDelegate = self as? NewsRoomViewControllerDelegate
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if (sender as? UITableViewCell) != nil {
               
                if segue.identifier == "NewsRoom" {
                    if let newsRoomVC = segue.destination as? NewsRoomViewController {
                        self.newsRoomDelegateVar = newsRoomVC
                    }
                }
            }
        
    }
    
    func newsRoomView() {
        print("hi")
        let vc = NewsRoomViewController() //your view controller
        self.newsRoomDelegateVar = vc
    }
    func didChangePageControlValue(pageControl: UIPageControl) {
       newsRoomDelegateVar?.scrollToViewController(index: pageControl.currentPage)
    }
    

}

