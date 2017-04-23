//
//  SettingsViewController.swift
//  DogKeyboardApp
//
//  Created by Sanny Chun on 4/3/17.
//  Copyright © 2017 TeamSupreme. All rights reserved.
//

import UIKit
import Foundation
import NMSSH

class SettingsViewController: UIViewController {

    // MARK: Properties
    // Wireless SSID and Password variable
    @IBOutlet weak var ssidTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var savedSsid: UILabel!
    @IBOutlet weak var disableSwitch: UISwitch!
    let session = NMSSHSession(host: "199.66.180.8", andUsername: "DogKeyboard")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let defaults = UserDefaults.standard
        // Set savedSsid label.
        if let ssid = defaults.object(forKey: "ssidStore") as? String{
            savedSsid.text = ssid
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
        savedSsid.text = ssid
        serverConnect()
        uploadFile(content: "ssid: " + ssid! + "\n" + "pw: " + pw!, fileName: "settings")
        session?.disconnect()
        
        //Userdefaults: save ssid and pw even if the app is closed.
        let defaults = UserDefaults.standard
        defaults.set(ssid, forKey:"ssidStore")
        defaults.set(pw, forKey:"pwStore")
        defaults.synchronize()
    }
    
    
    // MARK: Server Connection
    // SSH: establish connection to server. Server is Reese Aitken's private server for now.
    func serverConnect() {
        session?.connect()
        if session?.isConnected == true {
            session?.authenticate(byPassword: "TeamSupreme186")
            if session?.isAuthorized == true {
                print("Connection Successful.")
            }
        }
    }

    // Action for the state change of the disable button
    @IBAction func disableSwitchPressed(_ sender: Any) {
        if disableSwitch.isOn {
            
        } else {
            
        }
    }
    
    // MARK: Uploading File to Server
    // Upload the settings file to the server
    func uploadFile(content: String, fileName: String) {
        let contentToWrite = content + "\n"
        let directoryURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let fileURL = directoryURL.appendingPathComponent(fileName).appendingPathExtension("txt")
        print("FilePath: \(fileURL.path)")
        
        do {
            try contentToWrite.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
            print("Settings successfully saved.")
        } catch let error as NSError {
            print("Failed to save the settings.")
        }
        
        if session?.isConnected == true {
            session?.sftp.connect()
            session?.sftp.writeFile(atPath: fileURL.path, toFileAtPath: "/home/DogKeyboard/settings.txt")
            session?.sftp.disconnect()
        } else {
            print("cannot connect to the server.")
        }
    }
}
