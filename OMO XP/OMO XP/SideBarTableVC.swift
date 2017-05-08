//
//  SideBarTableVC.swift
//  OMO XP
//
//  Created by Casper Castellini on 4/24/17.
//  Copyright © 2017 Appomo. All rights reserved.
//

import UIKit


protocol SideBarTableVCDelegate {
    func sideBarControlDidSelectRow(indexPath:NSIndexPath)
}

class SideBarTableVC: UITableViewController {
    
    var delegate:SideBarTableVCDelegate?
    var tableData:Array<String> = []


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
    
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tableData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) 

        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
         
            // Configure the cell...
            
            cell.backgroundColor = UIColor.clear
            cell.textLabel?.textColor = UIColor.darkText
            
            let selectedView:UIView = UIView(frame: CGRect(x: 0, y: 0, width: cell.frame.size.width, height: cell.frame.size.height))
            selectedView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
            
            cell.selectedBackgroundView = selectedView
        }
        
        cell.textLabel?.text = tableData[indexPath.row]

        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.sideBarControlDidSelectRow(indexPath: indexPath as NSIndexPath)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
