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
        
        // Calls ProfileVC
        let menuViewController = self.storyboard?.instantiateViewController(withIdentifier: "profile") as! ProfileVC
        self.addChildViewController(menuViewController)
        menuViewController.view.frame = self.view.frame
        self.view.addSubview(menuViewController.view)
        menuViewController.didMove(toParentViewController: self)
    }
    
    @IBAction func filter(_ sender: Any) {
        
        // Calls FilterVC
        let filterViewController = self.storyboard?.instantiateViewController(withIdentifier: "filter") as! FilterVC
        self.addChildViewController(filterViewController)
        filterViewController.view.frame = self.view.frame
        self.view.addSubview(filterViewController.view)
        filterViewController.didMove(toParentViewController: self)
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
    
    let neighborhood = ["West Hollywood", "West Hollywood", "Beverly Hills", "Studio City", "Santa Monica"]
    
    let cuisine = ["Sushi", "American", "Steakhouse", "Sushi", "American"]
    
    let amount = ["$30 min", "$30 min", "$50 min", "$25 min", "$15 min"]
    
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return restaurantLabel.count
        
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as! MainListCell
        
        cell.vendorImage.image = UIImage(named: (restaurantImg[indexPath.row] + ".jpg"))
        cell.vendorLabel.text = restaurantLabel[indexPath.row]
        cell.amountLabel.text = amount[indexPath.row]
        cell.vendorLocation.text = neighborhood[indexPath.row]
        cell.cuisineLabel.text = cuisine[indexPath.row]
        
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
        
        let nibName = UINib(nibName: "MainListCell", bundle: nil)
        listView.register(nibName, forCellReuseIdentifier: "listCell")
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
