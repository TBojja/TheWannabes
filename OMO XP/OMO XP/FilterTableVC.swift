//
//  FilterTableVC.swift
//  OMO XP
//
//  Created by Casper Castellini on 5/7/17.
//  Copyright © 2017 Appomo. All rights reserved.
//

import UIKit

class FilterTableVC: UITableViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        
/*          if indexPath.row == 0 {
            self.view.removeFromSuperview()
            dismiss(animated: false, completion: nil)
            let changeVC = self.storyboard?.instantiateViewController(withIdentifier: "home") as! MainMenuVC
            self.navigationController?.pushViewController(changeVC, animated: true)
            
        } else {
            
            self.view.removeFromSuperview()
            dismiss(animated: false, completion: nil)
            let changeVC = self.storyboard?.instantiateViewController(withIdentifier: "home") as! MainMenuVC
            self.navigationController?.pushViewController(changeVC, animated: true)
        }
 */
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 175
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
    }
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

}
