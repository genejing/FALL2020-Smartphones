//
//  ForgetPasswordViewController.swift
//  LoginApp
//
//  Created by Xinhao Jing on 11/17/20.
//

import UIKit
import Firebase
import SwiftSpinner

class ForgetPasswordViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var txtPasswordAgain: UITextField!
    
    
    @IBOutlet weak var lblStatus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func resetAction(_ sender: Any) {
        let email = txtEmail.text
        if email?.isEmail == false {
            lblStatus.text = "Please enter valid email"
            return
        }
        let firebaseAuth = Auth.auth()
        firebaseAuth.sendPasswordReset(withEmail: email!) { [weak self]error in
            guard let strongSelf = self else { return }
            if error != nil {
                strongSelf.lblStatus.text = error?.localizedDescription
                return
            }
            let password = strongSelf.txtPassword.text
            if password!.count < 6 {
                strongSelf.lblStatus.text = "Please correct password"
                return
            }
            let passwordAgain = strongSelf.txtPasswordAgain.text
            if password != passwordAgain {
                strongSelf.lblStatus.text = "Please match password"
                return
            }
            
            SwiftSpinner.show("Loggin in...")

            let user = firebaseAuth.currentUser
            user?.delete { error in
                if error != nil {
                    strongSelf.lblStatus.text = error?.localizedDescription
                    return
                }
            }
            firebaseAuth.createUser(withEmail: email!, password: password!) { [weak self]authResult, error in
                SwiftSpinner.hide()
                guard let strongSelf = self else { return }
                guard let user = authResult?.user,error == nil else {
                    strongSelf.lblStatus.text = error?.localizedDescription
                    return
                }
                print("\(user.email!) password reset")
                strongSelf.navigationController?.popViewController(animated: true)
            }
          
        }
        
    }
  
    

}
