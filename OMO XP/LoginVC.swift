//
//  LoginVC.swift
//  OMO XP
//
//  Created by Casper Castellini on 4/6/17.
//  Copyright © 2017 Appomo. All rights reserved.
//

import UIKit

class LoginVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var email: UITextField!
    
    @IBOutlet var password: UITextField!
    
    @IBAction func retrievePassword(_ sender: Any) {
    }
    
    @IBAction func login(_ sender: Any) {
    }
    
    @IBAction func facebookLogin(_ sender: Any) {
    }
    
    @IBAction func signUp(_ sender: Any) {
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
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
