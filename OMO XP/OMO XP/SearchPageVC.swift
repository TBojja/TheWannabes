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
    
    @IBOutlet var resultsTableView: UITableView!
    
    // var scheduleToDisplay = ""
    
    let cellImages: [UIImage] = [#imageLiteral(resourceName: "pin3Copy"), #imageLiteral(resourceName: "pin3Copy"), #imageLiteral(resourceName: "pin3Copy"), #imageLiteral(resourceName: "pin3Copy"), #imageLiteral(resourceName: "pin3Copy")]
    
    var cellResults: [String] = ["Katana", "The Church Key", "Tender Greens", "Fresh Corn Grill", "Serafina"]
    
    var header: [String] = ["Results"]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return header.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cellResults.count
    }

    /*
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
    */
    

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultsCell", for: indexPath) as! SearchResultCell
        
        cell.resultsLabel.text = cellResults[indexPath.row]
        cell.resultsLabel.numberOfLines = 0  // gives as many lines as needed in cell depending on content
        
        return cell
        
    }
 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        resultsTableView.delegate = self
        resultsTableView.dataSource = self
        
        resultsTableView.rowHeight = UITableViewAutomaticDimension
        
        // scheduleLabel.text = scheduleToDisplay
        
        let nibName = UINib(nibName: "SearchResultCell", bundle: nil)
        resultsTableView.register(nibName, forCellReuseIdentifier: "resultsCell")
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
