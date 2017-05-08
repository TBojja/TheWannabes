//
//  ProfileVC.swift
//  OMO XP
//
//  Created by Casper Castellini on 5/6/17.
//  Copyright © 2017 Appomo. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    
    @IBOutlet var sideMenuView: UIView!
    
    
    @IBOutlet var btnClose: UIButton!
    
    @IBAction func dismissSideMenu(_ sender: Any) {
        self.sideMenuView.frame = CGRect(x: -220.0, y: 0.0, width:220.0, height: 667.0)
        self.view.frame = (CGRect(x: -375.0, y: 0.0, width: 375.0, height: 667.0))
        
        
        
        /* let mainViewController = self.storyboard?.instantiateViewController(withIdentifier: "home") as! MainMenuVC
        self.addChildViewController(mainViewController)
        mainViewController.view.frame = self.view.frame
        self.view.addSubview(mainViewController.view)
        mainViewController.didMove(toParentViewController: self)
         */
    }
    
    @IBOutlet var leadingConstraint: NSLayoutConstraint!
    
    @IBOutlet var trailingConstraint: NSLayoutConstraint!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   

}
