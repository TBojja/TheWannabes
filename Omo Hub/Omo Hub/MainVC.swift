//
//  MainVC.swift
//  Omo Hub
//
//  Created by Casper Castellini on 4/30/17.
//  Copyright © 2017 Appomo. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBAction func btnNew(_ sender: Any) {
    }
    
    @IBAction func btnUpcoming(_ sender: Any) {
    }
    
    @IBOutlet var reservationsTableView: UITableView!


    var joinRSVP = ["iconCopy3", "iconCopy3", "iconCopy3", "iconCopy3", "iconCopy3"]
    
    var reservationData = ["John Doe", "Alexander Berg", "Gregg Monroe", "Chris Mcaffrey", "Bob Marley"]
    
    var reservationInfo = ["Table for 3, Today at 8:00 PM", "Table for 2, Today at 7:00 PM", "Table for 5, Tomorrow at 8:30 PM", "Table for 2, Wed May 3 at 9:00 PM", "Table for 4, Thur May 4 at 7:30 PM"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.title = "UITableView"
        reservationsTableView.dataSource = self
        reservationsTableView.delegate = self
        
        let nibName = UINib(nibName: "ReservationsCell", bundle: nil)
        reservationsTableView.register(nibName, forCellReuseIdentifier: "cell")
        
        let nibNameCustom = UINib(nibName: "CustomCell", bundle: nil)
        reservationsTableView.register(nibNameCustom, forCellReuseIdentifier: "customCell")
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reservationData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.row % 2 == 0) {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomCell
            
            cell.nameLabel.text = reservationData[indexPath.row]
            cell.nameLabel.textColor = UIColor(red: (191.0/255.0), green: (155.0/255.0), blue: (110.0/255.0), alpha: 1.0)
            cell.infoLabel.text = reservationInfo[indexPath.row]
            cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
            
            return cell
        
        } else {
           
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ReservationsCell
            
            cell.nameLabel.text = reservationData[indexPath.row]
            cell.nameLabel.textColor = UIColor(red: (191.0/255.0), green: (155.0/255.0), blue: (110.0/255.0), alpha: 1.0)
            cell.infoLabel.text = reservationInfo[indexPath.row]
            cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
            
            return cell
            
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            
            reservationData.remove(at: indexPath.row)
            reservationsTableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    
}
