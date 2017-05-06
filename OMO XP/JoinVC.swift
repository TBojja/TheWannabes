//
//  JoinVC.swift
//  OMO XP
//
//  Created by Casper Castellini on 4/8/17.
//  Copyright © 2017 Appomo. All rights reserved.
//

import UIKit

class JoinVC: UIViewController, UITextFieldDelegate {
    
    @IBAction func dismissJoin(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet var codeTextField: UITextField!
    
    
    @IBAction func btnConfirm(_ sender: Any) {
    }

    @IBAction func btnHow(_ sender: Any) {
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Connect data:
        self.codeTextField.delegate = self

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
    
}
