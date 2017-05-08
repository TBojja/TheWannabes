//
//  FilterVC.swift
//  OMO XP
//
//  Created by Casper Castellini on 5/7/17.
//  Copyright © 2017 Appomo. All rights reserved.
//

import UIKit

class FilterVC: UIViewController {
    
    @IBOutlet var sideFilterView: UIView!
    
    @IBOutlet var btnClose: UIButton!
    
    @IBAction func dismissSideFilter(_ sender: Any) {
        self.view.frame = (CGRect(x: 375.0, y: 0.0, width: 375.0, height: 667.0))
        
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
