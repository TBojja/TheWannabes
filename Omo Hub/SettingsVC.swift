//
//  SettingsVC.swift
//  Omo Hub
//
//  Created by Casper Castellini on 5/2/17.
//  Copyright © 2017 Appomo. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "UITableView"
        tableView.dataSource = self
        tableView.delegate = self
        
        let nibHeader = UINib(nibName: "HeaderCell", bundle: nil)
        tableView.register(nibHeader, forCellReuseIdentifier: "headerCell")
        
        let nibAbout = UINib(nibName: "AboutCell", bundle: nil)
        tableView.register(nibAbout, forCellReuseIdentifier: "aboutCell")
        
        let nibAddress = UINib(nibName: "AddressCell", bundle: nil)
        tableView.register(nibAddress, forCellReuseIdentifier: "addressCell")
        
        let nibPhone = UINib(nibName: "PhoneCell", bundle: nil)
        tableView.register(nibPhone, forCellReuseIdentifier: "phoneCell")
        
        let nibMin = UINib(nibName: "MinimumCell", bundle: nil)
        tableView.register(nibMin, forCellReuseIdentifier: "minCell")
        
        let nibHours = UINib(nibName: "HoursCell", bundle: nil)
        tableView.register(nibHours, forCellReuseIdentifier: "hoursCell")

        let nibMenu = UINib(nibName: "MenuCell", bundle: nil)
        tableView.register(nibMenu, forCellReuseIdentifier: "menuCell")
        
        let nibTerms = UINib(nibName: "TermsCell", bundle: nil)
        tableView.register(nibTerms, forCellReuseIdentifier: "termsCell")
        
        
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.row == 0) {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell", for: indexPath) as! HeaderCell
        cell.addImage.image = UIImage()
        cell.nameLabel.text = "Restaurant"
        cell.nameLabel.textAlignment = .center
        
        return cell
        
        } else if (indexPath.row == 1) {
           
        let cell = tableView.dequeueReusableCell(withIdentifier: "aboutCell", for: indexPath) as! AboutCell
        cell.headerLabel.text = "ABOUT"
        cell.headerLabel.textAlignment = .left
        cell.headerLabel.textColor = UIColor(red: (191.0/255.0), green: (155.0/255.0), blue: (110.0/255.0), alpha: 1.0)
        cell.aboutTextView.text = "The Church Key prepares New American fare served dim sum-style, with an extensive focus on seasonal shared plates. Craft cocktails are served on an array of specialty carts in the open industrial-chic space"
            
        return cell
            
        } else if (indexPath.row == 2) {
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "addressCell", for: indexPath) as! AddressCell
        cell.headerLabel.text = "ADDRESS"
        cell.headerLabel.textAlignment = .left
        cell.headerLabel.textColor = UIColor(red: (191.0/255.0), green: (155.0/255.0), blue: (110.0/255.0), alpha: 1.0)
        cell.addressLabel.text = "8730 Sunset Blvd West Hollywood, CA 90069"
        cell.addressLabel.textAlignment = .left
            
        return cell
            
        } else if (indexPath.row == 3) {
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "phoneCell", for: indexPath) as! PhoneCell
        cell.headerLabel.text = "PHONE"
        cell.headerLabel.textAlignment = .left
        cell.headerLabel.textColor = UIColor(red: (191.0/255.0), green: (155.0/255.0), blue: (110.0/255.0), alpha: 1.0)
        cell.phoneLabel.text = "(424) 249 - 3700"
        cell.phoneLabel.textAlignment = .left
            
        return cell
            
        } else if (indexPath.row == 4) {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "minCell", for: indexPath) as! MinimumCell
        cell.headerLabel.text = "SET MINIMUM ($)"
        cell.headerLabel.textAlignment = .left
        cell.headerLabel.textColor = UIColor(red: (191.0/255.0), green: (155.0/255.0), blue: (110.0/255.0), alpha: 1.0)
        cell.amtLabel.text = "$20"
        cell.amtLabel.textAlignment = .left
            
        return cell
            
        } else if (indexPath.row == 5) {
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "hoursCell", for: indexPath) as! HoursCell
        cell.headerLabel.text = "HOURS"
        cell.headerLabel.textAlignment = .left
        cell.headerLabel.textColor = UIColor(red: (191.0/255.0), green: (155.0/255.0), blue: (110.0/255.0), alpha: 1.0)
            
        return cell
            
        } else if (indexPath.row == 6) {
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as! MenuCell
        cell.headerLabel.text = "MENU"
        cell.headerLabel.textAlignment = .left
        cell.headerLabel.textColor = UIColor(red: (191.0/255.0), green: (155.0/255.0), blue: (110.0/255.0), alpha: 1.0)
            
        return cell
            
        } else {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "termsCell", for: indexPath) as! TermsCell
        cell.headerLabel.text = "TERMS / SUPPORT"
        cell.headerLabel.textAlignment = .left
        cell.headerLabel.textColor = UIColor(red: (191.0/255.0), green: (155.0/255.0), blue: (110.0/255.0), alpha: 1.0)
            
        return cell
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if (indexPath.row == 0) {
        return 150
        } else if (indexPath.row == 1) {
            return 120
        } else {
            return 50
        }
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
