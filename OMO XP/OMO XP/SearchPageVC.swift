//
//  SearchPageVC.swift
//  OMO XP
//
//  Created by Casper Castellini on 4/7/17.
//  Copyright © 2017 Appomo. All rights reserved.
//

import UIKit

class SearchPageVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBAction func dismissSearch(_ sender: Any) {
    }

    @IBAction func search(_ sender: Any) {
    }
    
    @IBOutlet var searchBar: UISearchBar!
    
    @IBOutlet var locationBar: UISearchBar!

    @IBOutlet var scheduleLabel: UILabel!
    
    // var scheduleToDisplay = ""
    
    
    @IBOutlet var resultsTableView: UITableView!
    
    
    let cellImages: [UIImage] = [#imageLiteral(resourceName: "pin3Copy"), #imageLiteral(resourceName: "pin3Copy"), #imageLiteral(resourceName: "pin3Copy"), #imageLiteral(resourceName: "pin3Copy"), #imageLiteral(resourceName: "pin3Copy")]
    
    var cellResults: [String] = ["Katana", "The Church Key", "Tender Greens", "Fresh Corn Grill", "Serafina"]
    

    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 5
    }

    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView()
        view.backgroundColor = UIColor.white
        
        let image = UIImageView(image: cellImages[section])
        image.frame = CGRect(x: 5, y: 10, width: 18.5, height: 25)
        view.addSubview(image)
        
        let label = UILabel()
        label.text = cellResults[section]
        label.frame = CGRect(x: 30, y: 10, width: 280, height: 16.5)
        
        view.addSubview(label)
        
        return view
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "resultCell")
        
        cell.textLabel?.text = cellResults[indexPath.row]
        cell.textLabel?.numberOfLines = 0  // gives as many lines as needed in cell depending on content
        
        return cell
        
    }
 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        resultsTableView.delegate = self
        resultsTableView.dataSource = self
        
        resultsTableView.rowHeight = UITableViewAutomaticDimension
        
        // scheduleLabel.text = scheduleToDisplay
        
        
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
