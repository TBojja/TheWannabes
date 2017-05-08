//
//  MainListVC.swift
//  OMO XP
//
//  Created by Casper Castellini on 4/7/17.
//  Copyright © 2017 Appomo. All rights reserved.
//

import UIKit

class MainListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBAction func menu(_ sender: Any) {
    }
    
    @IBAction func filter(_ sender: Any) {
    }
    
    @IBAction func mainMapView(_ sender: Any) {
    }
    
    @IBAction func searchBar(_ sender: Any) {
    }
    
    @IBOutlet var btnSearch: UIButton!
    
    
    @IBAction func joinRes(_ sender: Any) {
    }
    
    @IBAction func schedule(_ sender: Any) {
    }
    
    @IBOutlet var listView: UITableView!
    
    
    let restaurantImg = ["stairs", "dining", "bar", "table", "res", "cafe"]
    
    let restaurantLabel = ["Katana", "The Church Key", "BOA Steakhouse", "Iroha Sushi of Tokyo", "Tender Greens"]
    
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return restaurantLabel.count
        
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableCell", for: indexPath) as! MainListViewCell
        
        // _ = indexPath.row                 let row = indexPath.row immutable
        
        cell.vendorImage.image = UIImage(named: (restaurantImg[indexPath.row] + ".jpg"))
        
        cell.vendorTitle.text = restaurantLabel[indexPath.row]
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "selectedRestaurant", sender: nil)
        self.listView.deselectRow(at: indexPath, animated: true)
        
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        listView.delegate = self
        listView.dataSource = self
        
        btnSearch.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 22.5, right: 162.5)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
