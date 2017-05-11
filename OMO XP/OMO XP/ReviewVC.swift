//
//  ReviewVC.swift
//  OMO XP
//
//  Created by Casper Castellini on 4/26/17.
//  Copyright © 2017 Appomo. All rights reserved.
//

import UIKit

class ReviewVC: UIViewController, UITabBarDelegate, UITableViewDataSource {

    @IBOutlet var reviewTableView: UITableView!
    
    
    let headerTitles: [String] = ["PLEASE REVIEW YOUR ORDER SUMMARY", "CASPER'S MENU PREFERENCES:"]
    let headerImg: [UIImage] = [#imageLiteral(resourceName: "review")]
    var miniTitle: [String] = ["REVIEW"]
    let reviewImage: [UIImage] = [#imageLiteral(resourceName: "review")]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return headerTitles.count
    }
    
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
*/
    
    func tableView (_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.row == 0) {
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "header", for: indexPath) as! HeaderCell
            
            cell.headerLabel.text = "PLEASE REVIEW YOUR ORDER SUMMARY"
            
            return cell
            
        } else {
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "subheader", for: indexPath) as! SubHeaderCell
            
            cell.reservationInfoLabel.text = ""
            cell.scheduleInfoLabel.text = ""
            
            return cell
            
            // cell.miniHeaderLabel?.text = miniTitle[indexPath.row]
            // cell.miniHeaderLabel?.numberOfLines = 0
        
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nibHeader = UINib(nibName: "HeaderCell", bundle: nil)
        reviewTableView.register(nibHeader, forCellReuseIdentifier: "header")
        
        let nibSubHeader = UINib(nibName: "SubHeaderCell", bundle: nil)
        reviewTableView.register(nibSubHeader, forCellReuseIdentifier: "subheader")
        
        // reviewTableView.estimatedRowHeight = 50
        // reviewTableView.estimatedSectionHeaderHeight = 150
        // reviewTableView.rowHeight = UITableViewAutomaticDimension

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
