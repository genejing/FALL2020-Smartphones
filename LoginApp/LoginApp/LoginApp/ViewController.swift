//
//  ViewController.swift
//  LoginApp
//
//  Created by Xinhao Jing on 11/16/20.
//

import UIKit
import Firebase
import SwiftSpinner

class ViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var lblStatis: UILabel!
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func forgetPasswordAction(_ sender: Any) {
        
        
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        
        self.performSegue(withIdentifier: "signUpSegue", sender: self)
        
    }
    @IBAction func loginAction(_ sender: Any) {
        let email = txtEmail.text
        let password = txtPassword.text
        if email == "" || password!.count < 6 {
            lblStatis.text = "Please enter email and correct password"
            return
        }
        if email?.isEmail == false {
            lblStatis.text = "Please enter valid email"
            return
        }
        SwiftSpinner.show("Loggin in...")
        Auth.auth().signIn(withEmail: email!, password: password!) { [weak self] authResult, error in
            SwiftSpinner.hide()
            guard let strongSelf = self else { return }
            if error != nil {
                strongSelf.lblStatis.text = error?.localizedDescription
                return
                
            }
            
            self?.txtPassword.text = ""
            
            self!.performSegue(withIdentifier: "loginSegue", sender: self)
        }
        
        
        
        
    }


}

