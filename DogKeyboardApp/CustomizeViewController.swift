//
//  CustomizeViewController.swift
//  DogKeyboardApp
//
//  Created by Hyunsu Park on 4/23/17.
//  Copyright © 2017 TeamSupreme. All rights reserved.
//

import UIKit

class CustomizeViewController: UIViewController {

    var buttonPressed = false
    @IBOutlet weak var selected: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions for Number Buttons
    // Sets the buttonPressed variable and the selected label.
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
    
    // MARK: Play Sound Function
    @IBAction func playSound(_ sender: Any) {
        if (buttonPressed == false) {
            print("Please select one of the buttons to play")
        } else {
            
        }
        
    }
}
