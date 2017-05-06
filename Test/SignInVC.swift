//
//  SignInVC.swift
//  Omo Hub
//
//  Created by Casper Castellini on 4/30/17.
//  Copyright © 2017 Appomo. All rights reserved.
//

import UIKit

class SignInVC: UIViewController {
    
    @IBOutlet var emailTextField: UITextField!
    
    @IBOutlet var pwTextField: UITextField!
    
    @IBAction func btnForgotPw(_ sender: Any) {
    }

    @IBAction func btnSignIn(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}
