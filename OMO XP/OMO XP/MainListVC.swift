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
    
    
    let restaurantImg = ["stairs", "dining", "bar", "fancy", "res", "table"]
    
    let restaurantLabel = ["Katana", "The Church Key", "BOA Steakhouse", "Cecconi's", "Angelini Osteria", "Tender Greens"]
    
    let neighborhood = ["West Hollywood", "Mid-Wilshire", "Beverly Hills", "West Hollywood", "Santa Monica", "Fairfax"]
    
    let cuisine = ["Sushi", "American", "Steakhouse", "Italian", "Italian", "American"]
    
    let amount = ["$30 min", "$30 min", "$50 min", "$40 min", "$35 min", "$15 min"]
    
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return restaurantLabel.count
        
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.row == 0) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as! MainListCell
        
        cell.vendorImage.image = UIImage(named: (restaurantImg[indexPath.row] + ".jpg"))
            cell.vendorImage.layer.shadowColor = UIColor.black.cgColor
            cell.vendorImage.layer.shadowOffset = CGSize(width: 0, height: 0)
            cell.vendorImage.layer.shadowRadius = 5
            cell.vendorImage.layer.shadowOpacity = 1
        cell.vendorLabel.text = restaurantLabel[indexPath.row]
        cell.vendorLabel.textColor = UIColor.darkGray
        cell.vendorLabel.font = UIFont(name: "HelveticaNeue-Regular", size: 15)
        cell.amountLabel.text = amount[indexPath.row]
        cell.vendorLocation.text = neighborhood[indexPath.row]
        cell.cuisineLabel.text = cuisine[indexPath.row]
        
        return cell
        
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "listCell2", for: indexPath) as! MainListCell2
            
            // uploads images into indexPaths
            cell.vendorImage.image = UIImage(named: (restaurantImg[indexPath.row] + ".jpg"))
            // customize looks of images in each cell
                cell.vendorImage.layer.shadowColor = UIColor.darkGray.cgColor
                cell.vendorImage.layer.shadowOffset = CGSize(width: 0, height: 0)
                cell.vendorImage.layer.shadowRadius = 3.5
                cell.vendorImage.layer.shadowOpacity = 1
            // uploads vendor names into indexPaths
            cell.vendorLabel.text = restaurantLabel[indexPath.row]
            // customize style of names in each cell
                cell.vendorLabel.textColor = UIColor.white
                cell.vendorLabel.font = UIFont(name: "HelveticaNeue-Regular", size: 15)
                cell.vendorLabel.layer.shadowColor = UIColor.white.cgColor
                cell.vendorLabel.layer.shadowOffset = CGSize(width: 0, height: 0)
                cell.vendorLabel.layer.shadowRadius = 2
                cell.vendorLabel.layer.shadowOpacity = 0.5
            
            cell.amountLabel.text = amount[indexPath.row]
            cell.amountLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 12)
                cell.amountLabel.layer.shadowColor = UIColor.white.cgColor
                cell.amountLabel.layer.shadowOffset = CGSize(width: 0, height: 0)
                cell.amountLabel.layer.shadowRadius = 1
                cell.amountLabel.layer.shadowOpacity = 1
            cell.vendorLocation.text = neighborhood[indexPath.row]
            cell.vendorLocation.textColor = UIColor.white
            cell.cuisineLabel.text = cuisine[indexPath.row]
            cell.cuisineLabel.textColor = UIColor.white
            
            return cell
        
        }
        
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
        
        let nibTest1 = UINib(nibName: "MainListCell2", bundle: nil)
        listView.register(nibTest1, forCellReuseIdentifier: "listCell2")
        
        let nibTest2 = UINib(nibName: "MainListCell3", bundle: nil)
        listView.register(nibTest2, forCellReuseIdentifier: "listCell3")

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
