//
//  SettingsViewController.swift
//  DogKeyboardApp
//
//  Created by Sanny Chun on 4/3/17.
//  Copyright © 2017 TeamSupreme. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    // MARK: Properties
    // Wireless SSID and Password variable
    @IBOutlet weak var ssidTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var disableSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let defaults = UserDefaults.standard
        if let ssid = defaults.object(forKey: "ssidStore") as? String{
            testLabel.text = ssid
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Setting Functions
    // Action for save button pressed
    @IBAction func onButtonPressed(_ sender: Any) {
        let ssid = ssidTextField.text
        let pw = pwTextField.text
        ssidTextField.text = ssid
        
        //Userdefaults: save ssid and pw even if the app is closed.
        let defaults = UserDefaults.standard
        defaults.set(ssid, forKey:"ssidStore")
        defaults.set(pw, forKey:"pwStore")
        defaults.synchronize()
    }
    
    // Action for the state change of the disable button
    @IBAction func disableSwitchPressed(_ sender: Any) {
        if disableSwitch.isOn {
            
        } else {
            
        }
    }
}
