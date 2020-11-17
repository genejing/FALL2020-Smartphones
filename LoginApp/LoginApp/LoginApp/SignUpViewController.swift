//
//  SignUpViewController.swift
//  LoginApp
//
//  Created by Xinhao Jing on 11/16/20.
//

import UIKit
import Firebase
import SwiftSpinner

class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var txtEmail: UITextField!
        
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var lblStatus: UILabel!
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        let email = txtEmail.text
        let password = txtPassword.text
        if email == "" || password!.count < 6 {
            lblStatus.text = "Please enter email and correct password"
            return
        }
        if email?.isEmail == false {
            lblStatus.text = "Please enter valid email"
            return
        }
        SwiftSpinner.show("Loggin in...")
//        Auth.auth().signIn(withEmail: email!, password: password!) { [weak self] authResult, error in
//            SwiftSpinner.hide()
//            guard let strongSelf = self else { return }
//            if error != nil {
//                strongSelf.lblStatus.text = error?.localizedDescription
//                return
//            }
//            self?.txtPassword.text = ""
//            self!.performSegue(withIdentifier: "loginSegue", sender: self)
//        }
        
        Auth.auth().createUser(withEmail: email!, password: password!) { [weak self]authResult, error in
            SwiftSpinner.hide()
            guard let strongSelf = self else { return }
            guard let user = authResult?.user,error == nil else {
                strongSelf.lblStatus.text = error?.localizedDescription
                return
            }
            print("\(user.email!) created")
            strongSelf.navigationController?.popViewController(animated: true)
        }
    }
}
