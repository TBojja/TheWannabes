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
                expanded: false),
        Section(headerTitle: "SUGGESTIONS ",
                content: ["Most popular", "Recommendations", "Daily Specials"],
                expanded: false),
        Section(headerTitle: "CHOICE OF FOOD ",
                content: ["Beef", "Pork", "Poultry", "Seafood", "Vegetarian", "Vegan"],
                expanded: false),
        Section(headerTitle: "PORTION SIZE ",
                content: ["Small (up to 6oz)", "Medium (up to 10oz)", "Large (more than 12oz"],
                expanded: false),
        Section(headerTitle: "SPECIAL REQUEST ",
                content: ["Allergic reaction", "Lactose intolerance", "Others"],
                expanded: false),
        Section(headerTitle: "HEAT ",
                content: ["Mild", "Moderate", "Spicy hot"],
                expanded: false),
        Section(headerTitle: "OTHERS ",
                content: ["Specify"],
                expanded: false),
        ]
        
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
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
        if (sections[indexPath.section].expanded) {
            return 44
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = ExpandableHeaderView()
        header.customInit(title: sections[section].headerTitle, section: section, delegate: self)
        
        return header
        
         /*
         
         let frame = tableView.frame
         let btn = UIButton(type: .system)
         btn.backgroundColor = .black
         btn.alpha = 0.35
         btn.frame = CGRect(x: 8.0, y: 50.0, width: 359.0, height: 51.0)
         btn.addTarget(self,action: Selector("btnPressed"),for:.touchUpInside)
         let headerView = UIView(frame: CGRect(x: 8.0, y: 50.0, width: 359.0, height: 51.0))
         headerView.addSubview(btn)
         
         return headerView
         }
         */
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "labelCell")!
        cell.textLabel?.text = sections[indexPath.section].content[indexPath.row]
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.font = UIFont(name: "HelveticaNeue", size: 14.0)
        
        return cell
    }
    
    func toggleSection(header: ExpandableHeaderView, section: Int) {
        sections[section].expanded = !sections[section].expanded
        
        tableView.beginUpdates()
        for i in 0 ..< sections[section].content.count {
            tableView.reloadRows(at: [IndexPath(row: i, section: section)], with: .automatic)
        }
        tableView.endUpdates()
    }

/*
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        btnCourses.setTitle("\(sections[indexPath.section].content[indexPath.row])", for: UIControlState.normal)
        tableViewCourses.isHidden = true
    }
*/

}
