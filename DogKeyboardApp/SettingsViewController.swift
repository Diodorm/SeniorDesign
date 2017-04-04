//
//  SettingsViewController.swift
//  DogKeyboardApp
//
//  Created by Sanny Chun on 4/3/17.
//  Copyright © 2017 TeamSupreme. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var ssidTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var testLabel: UILabel!
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
    
    @IBAction func onButtonPressed(_ sender: Any) {
        let ssid = ssidTextField.text
        testLabel.text = ssid
        
        //Userdefaults
        let defaults = UserDefaults.standard
        defaults.set(ssid, forKey:"ssidStore")
        defaults.synchronize()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
