//
//  MainMenuVC.swift
//  OMO XP
//
//  Created by Casper Castellini on 4/6/17.
//  Copyright © 2017 Appomo. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MainMenuVC: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    
    var locationManager = CLLocationManager()
    
    
    
    @IBOutlet var navBar: UINavigationBar!
    
    @IBAction func menu(_ sender: Any) {
        
        // Calls ProfileVC
        let menuViewController = self.storyboard?.instantiateViewController(withIdentifier: "profile") as! ProfileVC
        self.addChildViewController(menuViewController)
        menuViewController.view.frame = self.view.frame
        self.view.addSubview(menuViewController.view)
        menuViewController.didMove(toParentViewController: self)
    }
    
    
    @IBAction func filter(_ sender: Any) {
    }

    @IBOutlet var mapView: MKMapView!
    
    @IBAction func locator(_ sender: Any) {
    }
    
    @IBAction func mainListView(_ sender: Any) {
    }
    
    @IBOutlet var btnSearch: UIButton!
    
    @IBAction func searchBar(_ sender: Any) {
    }
    
    @IBOutlet var displaySchedule: UILabel!
    
    var scheduleLabel = ""
    
    @IBAction func joinRes(_ sender: Any) {
    }
    
    @IBAction func schedule(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // navigation bar customized size
        self.navBar.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 64)
        
        btnSearch.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 22.5, right: 162.5)
        
        // displays schedule data that has been passed through
        displaySchedule.text = scheduleLabel
        
        let latitude: CLLocationDegrees = 34.07
        let longitude: CLLocationDegrees = -118.39
        let latDelta: CLLocationDegrees = 0.05
        let lonDelta: CLLocationDegrees = 0.05
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        let location: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let region: MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let userLocation: CLLocation = locations[0]
        let latitude = userLocation.coordinate.latitude
        let longitude = userLocation.coordinate.longitude
        let latDelta: CLLocationDegrees = 0.05
        let lonDelta: CLLocationDegrees = 0.05
        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let region = MKCoordinateRegion(center: location, span: span)
        
        self.mapView.setRegion(region, animated: true)
        
        
        
    }

}
