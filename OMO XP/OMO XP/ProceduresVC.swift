//
//  ProceduresVC.swift
//  OMO XP
//
//  Created by Casper Castellini on 4/14/17.
//  Copyright © 2017 Appomo. All rights reserved.
//

import UIKit

class ProceduresVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var btnCourses: UIButton!
    
    @IBAction func btnDrop(_ sender: Any) {
        
        if self.tableViewCourses.isHidden == true {
            self.tableViewCourses.isHidden = false
        
        } else {
            self.tableViewCourses.isHidden = true
        }
        
    }
    
    @IBOutlet var tableViewCourses: UITableView!
    

    var courses = ["Single (1 - course)", "Double (2 - course)", "Triple (3 - course)", "Multi (4+ - course)", "Tasting menu"]
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "CourseCell")
    
        cell.textLabel?.text = courses[indexPath.row]
        cell.textLabel?.textAlignment = .center
        
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        btnCourses.setTitle("\(courses[indexPath.row])", for: UIControlState.normal)
        tableViewCourses.isHidden = true
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableViewCourses.delegate = self
        tableViewCourses.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
