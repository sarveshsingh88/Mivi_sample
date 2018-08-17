//
//  LoginViewC.swift
//  Mivi
//
//  Created by Nadeem on 16/08/18.
//  Copyright © 2018 Sample. All rights reserved.
//

import UIKit
import Foundation

class LoginViewC: UIViewController {

    @IBOutlet weak var txtFldUserName: BCUITextField!
    @IBOutlet weak var txtFldPassword: BCUITextField!
    @IBOutlet weak var btnSignIn: UIButton!
    @IBOutlet weak var btnForgetPassword: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        txtFldUserName.cornerRadiusAndBorder(radius: 4, borderWidth: 1, borderColor: .lightGray)
        txtFldPassword.cornerRadiusAndBorder(radius: 4, borderWidth: 1, borderColor: .lightGray)
        btnSignIn.cornerRadiusAndBorder(radius: 4, borderWidth: 0, borderColor: .clear)

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationController?.isNavigationBarHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: IBAction
    
    @IBAction func onTapSignInBtn(_ sender: UIButton) {
        
        guard let userName = txtFldUserName.text, userName.count > 0 else {
            Alert.showAlertWithActionWithCancel(title: "MIVI", message: "Please enter user name", style: .alert, actionTitles: ["Ok"], showCancel: false, deleteTitle: nil, self, action: nil)
            return
        }
        
        guard let password = txtFldPassword.text, password.count > 0 else {
            Alert.showAlertWithActionWithCancel(title: "MIVI", message: "Please enter password", style: .alert, actionTitles: ["Ok"], showCancel: false, deleteTitle: nil, self, action: nil)
            return
        }
        let hardCodedPassword = "123456"
        if let dataModel = DataParser.dataModel(), let email = dataModel.attributes?.emailAddress {
            
            if email == userName, hardCodedPassword == password {
                self.moveToHomeScreen()
            } else {
                Alert.showAlertWithActionWithCancel(title: "MIVI", message: "Wrong Email or Password", style: .alert, actionTitles: ["Ok"], showCancel: false, deleteTitle: nil, self, action: nil)
            }
        }
    }
    
    @IBAction func onTapForgetPassword(_ sender: UIButton) {
        
    }

    private func moveToHomeScreen() {
        if let tabBarController = UIStoryboard.storyboard(.Main, bundle: nil).instantiateViewController(withIdentifier: BaseTabBarController.className) as? BaseTabBarController {
            if let window = UIApplication.shared.delegate?.window {
                window?.rootViewController = tabBarController
            }
        }
    }
}

