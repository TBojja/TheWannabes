//
//  RestaurantJoinVC.swift
//  OMO XP
//
//  Created by Casper Castellini on 4/9/17.
//  Copyright © 2017 Appomo. All rights reserved.
//

import UIKit

class RestaurantJoinVC: UIViewController {

    @IBAction func dismissJoin(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBOutlet var codeTextField: UITextField!
    
    @IBAction func btnConfirm(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
