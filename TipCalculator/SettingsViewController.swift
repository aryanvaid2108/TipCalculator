//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Aryan Vaid on 9/8/20.
//  Copyright © 2020 Aryan Vaid. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tipTextField1: UITextField!
    @IBOutlet weak var tipTextField2: UITextField!
    @IBOutlet weak var tipTextField3: UITextField!
    
    
    @IBOutlet weak var heading1Label: UILabel!
    
    @IBOutlet weak var subHeading1Label: UILabel!
    @IBOutlet weak var subHeading2Label: UILabel!
    @IBOutlet weak var subHeading3Label: UILabel!

    @IBOutlet weak var heading2Label: UILabel!
    
    @IBOutlet weak var nightModeSwitch: UISwitch!
    
    //Access UserDefaults
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        let nightModeCheck = defaults.string(forKey: "nightMode")
        if nightModeCheck == "On" {
            turnNightModeOn()
            nightModeSwitch.isOn = true
        }
        else{
            turnNightModeOff()
            nightModeSwitch.isOn = false
        }
        let tip1 = defaults.string(forKey: "tip1") ?? "10%"
        defaults.set(tip1, forKey: "tip1")
        tipTextField1.text = tip1
        
        let tip2 = defaults.string(forKey: "tip2") ?? "15%"
        defaults.set(tip2, forKey: "tip2")
        tipTextField2.text = tip2
        
        let tip3 = defaults.string(forKey: "tip3") ?? "20%"
        defaults.set(tip3, forKey: "tip3")
        tipTextField3.text = tip3
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let tip1 = defaults.string(forKey: "tip1") ?? "10%"
        defaults.set(tip1, forKey: "tip1")
        tipTextField1.text = tip1
        
        let tip2 = defaults.string(forKey: "tip2") ?? "15%"
        defaults.set(tip2, forKey: "tip2")
        tipTextField2.text = tip2
        
        let tip3 = defaults.string(forKey: "tip3") ?? "20%"
        defaults.set(tip3, forKey: "tip3")
        tipTextField3.text = tip3
    }
    
    @IBAction func tip1Changed(_ sender: UITextField) {
        let tip1 = tipTextField1.text!
        defaults.set(tip1, forKey: "tip1")
    }
    @IBAction func tip2Changed(_ sender: UITextField) {
        let tip2 = tipTextField2.text!
        defaults.set(tip2, forKey: "tip2")
    }
    @IBAction func tip3Changed(_ sender: UITextField) {
        let tip3 = tipTextField3.text!
        defaults.set(tip3, forKey: "tip3")
    }
    
    @IBAction func nightModeActivated(_ sender: UISwitch) {
        if sender.isOn == true {
            turnNightModeOn()
        }
        else {
            turnNightModeOff()
        }
    }
    func turnNightModeOn() {
        defaults.set("On", forKey: "nightMode")
        heading1Label.textColor = UIColor.white
        heading2Label.textColor = UIColor.white
        subHeading1Label.textColor = UIColor.white
        subHeading2Label.textColor = UIColor.white
        subHeading3Label.textColor = UIColor.white
        self.view.backgroundColor = UIColor.black
    }
    func turnNightModeOff() {
        defaults.set("Off", forKey: "nightMode")
        heading1Label.textColor = UIColor.black
        heading2Label.textColor = UIColor.black
        subHeading1Label.textColor = UIColor.black
        subHeading2Label.textColor = UIColor.black
        subHeading3Label.textColor = UIColor.black
        self.view.backgroundColor = UIColor.white
    }
}

