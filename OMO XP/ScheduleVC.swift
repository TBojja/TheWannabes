//
//  ScheduleVC.swift
//  OMO XP
//
//  Created by Casper Castellini on 4/7/17.
//  Copyright © 2017 Appomo. All rights reserved.
//

import UIKit

class ScheduleVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBAction func dismissSchedule(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet var schedulePicker: UIPickerView!
    
    @IBOutlet var selectionLabel: UILabel!
    
    @IBAction func btnSearch(_ sender: Any) {
        performSegue(withIdentifier: "go", sender: self)
    }
    
    
    
    // Passing pickerView data to search page 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destVC = segue.destination as! MainMenuVC
        destVC.scheduleLabel = selectionLabel.text!
    }
    
    // Declaring new array instance variable to store list of reservation data

    var schedulePickerData =
    [["1 Person", "2 People", "3 People", "4 People", "5 People", "6 people", "7 People", "8 People", "9 People", "10 People"],
    ["Today", "Tomorrow", "Wed", "Thu", "Fri", "Sat", "Sun, Apr 30"],
    ["6:00PM", "6:30PM", "7:00PM", "7:30PM", "8:00PM", "8:30PM", "9:00PM", "9:30PM", "10:00PM"]]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Connect data:
        self.schedulePicker.delegate = self
        self.schedulePicker.dataSource = self
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // The number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return schedulePickerData.count
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return schedulePickerData[component].count
    }
    
    // The data to return for the row and component (column) that's being passed in
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return schedulePickerData[component][row]
    }
    
    // Capture the picker view selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        updateLabel()
        
    }
    
    // Method is triggered whenever the user makes a change to the picker selection.
    // Parameter named row and component represents what was selected.
    func updateLabel() {
        let size = schedulePickerData[0][schedulePicker.selectedRow(inComponent: 0)]
        
        let when = schedulePickerData[1][schedulePicker.selectedRow(inComponent: 1)]
        
        let hours = schedulePickerData[2][schedulePicker.selectedRow(inComponent: 2)]
        
        
        // Gold -> UIColor(red: 191, green: 155, blue: 110, alpha: 1)
        
        selectionLabel.text = "Table for " + size + " on " + when + " at " + hours
        
        
    }
    
    // Customize pickerView's font/size attributes
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        var schedulePicker = view as! UILabel!
        if schedulePicker == nil {
            schedulePicker = UILabel()
        }
        
        let data = schedulePickerData[component][row]
        let title = NSAttributedString(string: data, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 12.0, weight: UIFontWeightRegular)])
        schedulePicker?.attributedText = title
        schedulePicker?.textAlignment = .center
        return schedulePicker!
    }
    
    // Customize height of each row
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 20
    }
    
}
