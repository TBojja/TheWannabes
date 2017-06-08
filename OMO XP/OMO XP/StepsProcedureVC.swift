//
//  StepsProcedureVC.swift
//  OMO XP
//
//  Created by Casper Castellini on 5/5/17.
//  Copyright © 2017 Appomo. All rights reserved.
//

import UIKit

class StepsProcedureVC: UIViewController, UITableViewDelegate, UITableViewDataSource, ExpandableHeaderViewDelegate {

    @IBOutlet var navBar: UINavigationBar!
    
    @IBAction func leftBarItem(_ sender: Any) {
    }
    
    @IBOutlet var minAmtLabel: UILabel!
    
    
    @IBAction func btnMinus(_ sender: Any) {
    }
    
    @IBAction func btnPlus(_ sender: Any) {
    }
    
    @IBOutlet var amtLabel: UILabel!
    
    @IBAction func btnReview(_ sender: Any) {
    }
    
    @IBOutlet var tableView: UITableView!
    
    var sections = [
        Section(headerTitle: "COURSES",
                content: ["Single (1 - course)", "Double (2 - course)", "Triple (3 - course)", "Multi (4+ - course)", "Tasting menu"],
                expanded: false,
                subtitle: "Select course options"),
        Section(headerTitle: "SUGGESTIONS ",
                content: ["Most popular", "Recommendations", "Daily Specials"],
                expanded: false,
                subtitle: "Choose your suggestions"),
        Section(headerTitle: "CHOICE OF FOOD ",
                content: ["Beef", "Pork", "Poultry", "Seafood", "Vegetarian", "Vegan"],
                expanded: false,
                subtitle: "Select your protein preferences"),
        Section(headerTitle: "PORTION SIZE ",
                content: ["Small (up to 6oz)", "Medium (up to 10oz)", "Large (more than 12oz"],
                expanded: false,
                subtitle: "Preferred portion size"),
        Section(headerTitle: "SPECIAL REQUEST ",
                content: ["Allergic reaction", "Lactose intolerance", "Others"],
                expanded: false,
                subtitle: "Additional requests"),
        Section(headerTitle: "HEAT ",
                content: ["Mild", "Moderate", "Spicy hot"],
                expanded: false,
                subtitle: "Level of spiciness"),
        Section(headerTitle: "OTHERS ",
                content: ["Specify"],
                expanded: false,
                subtitle: "Please specify anything else"),
        ]
    
    // Attribute that holds the data from selected indexPath
    var selectIndexPath: IndexPath!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Initialize indexPath as invalid
        selectIndexPath = IndexPath(row: -1, section: -1)
        
        let nib = UINib(nibName: "ExpandableHeaderView", bundle: nil)
        tableView.register(nib, forHeaderFooterViewReuseIdentifier: "expandableHeaderView")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        // Customize UINavigationBar
        let attrs = [ NSFontAttributeName: UIFont(name: "HelveticaNeue-Medium", size: 16)! ]
        UINavigationBar.appearance().titleTextAttributes = attrs
        
        navBar.frame = CGRect(x: 0, y: 0, width: 375, height: 64)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].content.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        // To toggle/hide
        if (sections[indexPath.section].expanded) {
            return 44
        } else {
            return 0
        }
    }
    
        // Differentiate between the sections
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        // Create the headerView
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "expandableHeaderView") as! ExpandableHeaderView
        headerView.customInit(title: sections[section].headerTitle, subtitle: sections[section].subtitle, section: section, delegate: self)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "labelCell")!
        cell.textLabel?.text = sections[indexPath.section].content[indexPath.row]
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.font = UIFont(name: "HelveticaNeue", size: 14.0)
        // Set accessoryType to check mark or non
        cell.accessoryType = (indexPath == selectIndexPath) ? .checkmark:.none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectIndexPath = indexPath
        // Set subtitle = title of the cell
        self.sections[indexPath.section].subtitle = tableView.cellForRow(at: indexPath)?.textLabel?.text
        sections[indexPath.section].expanded = !sections[indexPath.section].expanded
        tableView.beginUpdates()
        tableView.reloadSections([indexPath.section], with: .automatic)
        tableView.endUpdates()
    }
    
    func toggleSection(header: ExpandableHeaderView, section: Int) {
        sections[section].expanded = !sections[section].expanded
        tableView.beginUpdates()
        tableView.reloadSections([section], with: .automatic)
        tableView.endUpdates()
    }

}
