//
//  SearchPageVC.swift
//  OMO XP
//
//  Created by Casper Castellini on 4/7/17.
//  Copyright © 2017 Appomo. All rights reserved.
//

import UIKit

class SearchPageVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    
    @IBAction func dismissSearch(_ sender: Any) {
    }

    @IBAction func search(_ sender: Any) {
    }
    
    @IBOutlet var searchBar: UISearchBar!
    

    @IBAction func btnSchedule(_ sender: Any) {
    }
    
    
    @IBOutlet var resultsTableView: UITableView!
    
    // var scheduleToDisplay = ""
    
    // let cellImages: [UIImage] = [#imageLiteral(resourceName: "pin3Copy"), #imageLiteral(resourceName: "pin3Copy"), #imageLiteral(resourceName: "pin3Copy"), #imageLiteral(resourceName: "pin3Copy"), #imageLiteral(resourceName: "pin3Copy")]
    
    var cellResults: [String] = ["Katana", "71above", "BOA Steakhouse", "Cecconi", "Angelini Osteria", "The Church Key", "Tender Greens", "Fresh Corn Grill", "Serafina"]
    
    var header: [String] = ["Results"]
    
    var filteredData = [String]()
    
    var isSearching = false
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return header.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isSearching {
            return filteredData.count
        }
        
        return cellResults.count
    }

    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView()
        view.backgroundColor = UIColor(red: (248.0/255.0), green: (247.0/255.0), blue: (241.0/255.0), alpha: 1.0)
        
     /*
        // Uncomment to add a UIImage into cell row 
        let image = UIImageView(image: cellImages[section])
        image.frame = CGRect(x: 5, y: 10, width: 18.5, height: 25)
        view.addSubview(image)
     */
        
        let label = UILabel()
        label.text = "RESULTS"
        label.textColor = UIColor.black
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 12)
        label.textAlignment = .center
        label.frame = CGRect(x: 2.5, y: 4.5, width: 72, height: 15)
        
        
        view.addSubview(label)
        
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
    }
    
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultsCell", for: indexPath) as! SearchResultCell
        
        if isSearching {
            cell.resultsLabel.text = filteredData[indexPath.row]
        } else {
            
            cell.resultsLabel.text = cellResults[indexPath.row]
        }
        
        cell.resultsLabel.numberOfLines = 0  // gives as many lines as needed in cell depending on content
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        
        return cell
        
    }
 
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            isSearching = false
            
            view.endEditing(true)
            
            resultsTableView.reloadData()
            } else {
            
            isSearching = true
            filteredData = cellResults.filter({$0 == searchBar.text})
            
            resultsTableView.reloadData()
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        resultsTableView.delegate = self
        resultsTableView.dataSource = self
        
        resultsTableView.rowHeight = UITableViewAutomaticDimension
        
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.done
        searchBar.isTranslucent = true
        
        
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
