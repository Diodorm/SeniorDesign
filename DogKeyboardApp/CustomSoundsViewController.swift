//
//  CustomSoundsViewController.swift
//  DogKeyboardApp
//
//  Created by Sanny Chun on 4/23/17.
//  Copyright © 2017 TeamSupreme. All rights reserved.
//

import UIKit

class CustomSoundsViewController: UIViewController {

    var buttonPressed = false
    
    @IBOutlet weak var selected: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        selected.text = "None"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func button1Pressed(_ sender: Any) {
        buttonPressed = true
        selected.text = "1"
    }
    @IBAction func button2Pressed(_ sender: Any) {
        buttonPressed = true
        selected.text = "2"
    }
    @IBAction func button3Pressed(_ sender: Any) {
        buttonPressed = true
        selected.text = "3"
    }
    @IBAction func button4Pressed(_ sender: Any) {
        buttonPressed = true
        selected.text = "4"
    }
    @IBAction func button5Pressed(_ sender: Any) {
        buttonPressed = true
        selected.text = "5"
    }
    @IBAction func button6Pressed(_ sender: Any) {
        buttonPressed = true
        selected.text = "6"
    }
    @IBAction func button7Pressed(_ sender: Any) {
        buttonPressed = true
        selected.text = "7"
    }
    @IBAction func button8Pressed(_ sender: Any) {
        buttonPressed = true
        selected.text = "8"
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
