//
//  ReviewVC.swift
//  OMO XP
//
//  Created by Casper Castellini on 4/26/17.
//  Copyright © 2017 Appomo. All rights reserved.
//

import UIKit

class ReviewVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet var navBar: UINavigationBar!
    
    @IBAction func leftBarItem(_ sender: Any) {
    }
  
    @IBOutlet var reviewTableView: UITableView!
    
    @IBAction func btnOrder(_ sender: Any) {
    }
    
    
    
    let headerTitles: [String] = ["PLEASE REVIEW YOUR ORDER SUMMARY", "CASPER'S MENU PREFERENCES:"]
    let headerImg: [UIImage] = [#imageLiteral(resourceName: "review")]
    var miniTitle: [String] = ["REVIEW"]
    let reviewImage: [UIImage] = [#imageLiteral(resourceName: "review")]

    
    

/*
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView()
        
        let image = UIImageView(image: headerImg[section])
        image.frame = CGRect(x: 5, y: 5, width: 30, height: 30)
        view.addSubview(image)
        
        let label = UILabel()
        label.text = miniTitle[section]
        label.frame = CGRect(x: 45, y: 5, width: 40, height: 15)
        view.addSubview(label)
        
        return view
    }


    func tableView (_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
*/
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.row == 0) {
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "header", for: indexPath) as! HeaderCell
            
            cell.headerLabel.text = "PLEASE REVIEW YOUR ORDER SUMMARY"
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            
            return cell
            
        } else  if (indexPath.row == 1) {
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "subheader", for: indexPath) as! SubHeaderCell
            
            cell.reservationInfoLabel.text = "John Doe"
            cell.scheduleInfoLabel.text = "Table for 5, Tomorrow at 9:00pm"
            cell.scheduleInfoLabel.numberOfLines = 5
            cell.selectionStyle = UITableViewCellSelectionStyle.none
           
            return cell
        
        } else  if (indexPath.row == 2) {
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "preferences", for: indexPath) as! PreferencesCell
            
            cell.headerLabel.text = "JOHN'S MENU PREFERENCES"
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            
            return cell
        } else {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "payment", for: indexPath)
            as! PaymentInfoCell
            
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // var height: CGFloat = CGFloat()
        if (indexPath.row == 0) {
            return 100
        } else  if (indexPath.row == 1) {
            return 125
        } else  if (indexPath.row == 2) {
            return 150
        } else {
            return 200
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Customize UINavigationBar
        let attrs = [NSFontAttributeName: UIFont(name: "HelveticaNeue-Medium", size: 16)!]
        UINavigationBar.appearance().titleTextAttributes = attrs
        
        navBar.frame = CGRect(x: 0, y: 0, width: 375, height: 64)
        
        reviewTableView.dataSource = self
        reviewTableView.delegate = self
        
        
        let nibHeader = UINib(nibName: "HeaderCell", bundle: nil)
        reviewTableView.register(nibHeader, forCellReuseIdentifier: "header")
        
        let nibSubHeader = UINib(nibName: "SubHeaderCell", bundle: nil)
        reviewTableView.register(nibSubHeader, forCellReuseIdentifier: "subheader")
        
        let nibPreferences = UINib(nibName: "PreferencesCell", bundle: nil)
        reviewTableView.register(nibPreferences, forCellReuseIdentifier: "preferences")
        
        let nibPayment = UINib(nibName: "PaymentInfoCell", bundle: nil)
        reviewTableView.register(nibPayment, forCellReuseIdentifier: "payment")
        
        // reviewTableView.estimatedRowHeight = 50
        // reviewTableView.estimatedSectionHeaderHeight = 150
        // reviewTableView.rowHeight = UITableViewAutomaticDimension // < -- Calculates rows height automatically

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
