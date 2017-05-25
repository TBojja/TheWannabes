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
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet var searchBar: UISearchBar!
    

    @IBAction func btnSchedule(_ sender: Any) {
    }
    
    
    @IBOutlet var resultsTableView: UITableView!
    
    // var scheduleToDisplay = ""
    
    var cellResults: [String] = ["Katana", "71above", "BOA Steakhouse", "Cecconi", "Angelini Osteria", "The Church Key", "Tender Greens", "Fresh Corn Grill", "Serafina"]
    
    var header: [String] = ["Results"]
    
    // Variables or restaurant vendors added for search function
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
                } else {
                    return cellResults.count
                }
    }

    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        /*
         // Uncomment to add a UIImage into cell row
         let image = UIImageView(image: cellImages[section])
         image.frame = CGRect(x: 5, y: 10, width: 18.5, height: 25)
         view.addSubview(image)
         */
        
        let view = UIView()
        view.backgroundColor = UIColor(red: (248.0/255.0), green: (247.0/255.0), blue: (241.0/255.0), alpha: 1.0)
        
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
    
    // Functions for adding search
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredData = cellResults.filter({ (names: String) -> Bool in
            return names.lowercased().range(of: searchText.lowercased()) != nil
        })
        
        if searchText != "" {
            isSearching = true
            self.resultsTableView.reloadData()
        } else {
            isSearching = false
            self.resultsTableView.reloadData()
        }
    }
    
    // End functions for adding search
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        searchBar.endEditing(true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        isSearching = true
        searchBar.endEditing(true)
        self.resultsTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        resultsTableView.delegate = self
        resultsTableView.dataSource = self
        
        resultsTableView.rowHeight = UITableViewAutomaticDimension
        
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.search
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
