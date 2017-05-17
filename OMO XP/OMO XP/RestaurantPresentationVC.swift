//
//  RestaurantPresentationVC.swift
//  OMO XP
//
//  Created by Casper Castellini on 4/7/17.
//  Copyright © 2017 Appomo. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class RestaurantPresentationVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, MKMapViewDelegate, CLLocationManagerDelegate {
    

    @IBAction func btnBack(_ sender: Any) {
    }

    
    @IBOutlet var vendorImg: UIImageView!
    
    @IBOutlet var btnFav: UIBarButtonItem!
    
    @IBOutlet var amtLabel: UIBarButtonItem!
   
    // NOTE: Information Popup
    @IBAction func info(_ sender: Any) {
    }
    
    @IBAction func join(_ sender: Any) {
    }
    
    @IBAction func phone(_ sender: Any) {
    }
    
    @IBAction func hours(_ sender: Any) {
    }
    
    @IBAction func menu(_ sender: Any) {
    }
    
    @IBOutlet var imgProfile: UIImageView!

    @IBOutlet var descriptionLabel: UILabel!
    
    @IBAction func btnReservation(_ sender: Any) {
    }
    
    @IBOutlet var timeCollection: UICollectionView!
    
    
    @IBAction func timeButton(_ sender: Any) {
        
        // Creating action sheet versus popup 
/*        let alertController = UIAlertController(title: "OMO", message: "Reservation / Order", preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Order", style: .default, handler: self.orderHandler))
        alertController.addAction(UIAlertAction(title: "Reserve Only", style: .default, handler: self.reserveHandler))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alertController, animated: true, completion: nil)
*/
    }
/*
    func orderHandler(alert: UIAlertAction!) {
        self.navigationController?.pushViewController(UIViewController(), animated: true)
    }
    
    func reserveHandler(alert: UIAlertAction!) {
        self.navigationController?.pushViewController(UIViewController(), animated: true)
    }
*/
    
    
    @IBOutlet var vendorAddress: UILabel!

    
    @IBOutlet var navBar: UINavigationBar!
    
    
    
    
    var locationManager = CLLocationManager()
    
    var activeRow = 0
    let reuseIdentifier = "cell"
    var items = ["6:00PM", "6:30PM", "7:00PM", "7:30PM", "8:00PM", "8:30PM", "9:00PM", "9:30PM", "10:00PM"]
    
    
    // UICollectionViewDataSource protocol
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
        
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! TimesCollectionViewCell

        // Use the outlet in custom class to get a reference to the UILabal in the cell
        cell.myLabel.text = self.items[indexPath.item]
        // cell.backgroundColor = UIColor(red: 191, green: 155, blue: 110, alpha: 0.85)
    
        return cell
        
    }
    
    // UICollectionViewDelegate protocol
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // handle tap events
        print("You selected time cell #\(indexPath.item)!")
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Customize navigationBar
        let attrs = [ NSFontAttributeName: UIFont(name: "HelveticaNeue-Medium", size: 16)! ]
        UINavigationBar.appearance().titleTextAttributes = attrs
        
        // navBar.backgroundColor = UIColor.clear
        navBar.frame = CGRect(x: 0, y: 0, width: 375, height: 64)
        navBar.barStyle = .blackTranslucent
        navBar.layer.shadowColor = UIColor.clear.cgColor
        navBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        navBar.layer.shadowRadius = 1
        navBar.layer.shadowOpacity = 1
        // UINavigationBar.appearance().isTranslucent = true
        
        // Do any additional setup after loading the view.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
