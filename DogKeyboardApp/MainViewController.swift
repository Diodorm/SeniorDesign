//
//  MainViewController.swift
//  DogKeyboardApp
//
//  Created by Sanny Chun on 3/28/17.
//  Copyright © 2017 TeamSupreme. All rights reserved.
//

import UIKit
import CoreBluetooth

class MainViewController: UIViewController  {

    @IBOutlet weak var disconnectButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        //This is basically your main method
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func disconnectButtonPressed(_ sender: UIButton) {
        //disconnect bluetooth functionality
        
        self.navigationController?.popViewController(animated: true)
        
    }

}
