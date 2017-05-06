//
//  CreateAcctVC.swift
//  OMO XP
//
//  Created by Casper Castellini on 4/6/17.
//  Copyright © 2017 Appomo. All rights reserved.
//

import UIKit

class CreateAcctVC: UIViewController, UITextFieldDelegate {



    @IBOutlet var email: UITextField!
    
    @IBOutlet var password: UITextField!
    
    @IBOutlet var confirmPassword: UITextField!
    
    @IBOutlet var phoneNumber: UITextField!
    
    @IBAction func createAcct(_ sender: Any) {
    }
    
    @IBAction func signIn(_ sender: Any) {
    }
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
