//
//  LoginViewController.swift
//  Olimpo
//
//  Created by jcapasix on 5/7/17.
//  Copyright © 2017 Jordan Capa. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, LoginProtocol{

    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    
    var presenter :LoginPresenter?
    var router :LoginRouter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = LoginConfigurator.sharedInstance.configure(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - ACTIONS BUTTONS
    @IBAction func clickBtnLogin(_ sender: Any) {
        print("Click in LoginViewController")
        self.presenter?.login()
    }
    
    
    func showLoading(){
        print("Show Loading")
    }
    func hideLoading(){
        print("Hide Loading")
    }
    func gotoHome(){
        print("Go to Home")
    }
    func getUserName()->String?{
        return self.txtUsername.text!
    }
    func getPassword()->String?{
        return self.txtPassword.text!
    }


}

