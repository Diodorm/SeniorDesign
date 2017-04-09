//
//  ViewController.swift
//  DogKeyboardApp
//
//  Created by Sanny Chun  & Hyunsu Park on 3/12/17.
//  Copyright © 2017 TeamSupreme. All rights reserved.
//

import UIKit
import CoreBluetooth
import NMSSH

class PairViewController: UIViewController, CBCentralManagerDelegate, CBPeripheralDelegate {
    
    // MARK: Properties
    // Bluetooth: variables
    var manager: CBCentralManager!
    var peripheral: CBPeripheral!
    var isConnected = false
    
    // Bluetooth: UUID and Service Name
    let BEAN_NAME = "DogKeyboard"
    let BEAN_SCRATCH_UUID =
        CBUUID(string: "a495ff21-c5b1-4b44-b512-1370f02d74de")
    let BEAN_SERVICE_UUID =
        CBUUID(string: "a495ff20-c5b1-4b44-b512-1370f02d74de")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Bluetooth: Manager Declaration
        manager = CBCentralManager(delegate: self, queue: nil)
    }
    
    //Action taken when Green Button is pressed:
    //Attempt connection to server via SSH
    @IBAction func onPairPressed(_ sender: Any) {
        serverConnect()
        if isConnected == true {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "homeViewController")
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    // MARK: Server Connection
    // SSH: establish connection to server. Server is Reese Aitken's private server for now.
    func serverConnect() {
        let session = NMSSHSession(host: "199.66.180.8", andUsername: "DogKeyboard")
        session?.connect()
        
        if session?.isConnected == true {
            session?.authenticate(byPassword: "TeamSupreme186")
            if session?.isAuthorized == true {
                print("Connection Successful.")
                isConnected = true
            }
        }
    }
    
    // MARK: Bluetooth Pairing
    // Bluetooth: Scan for devices
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case CBManagerState.unknown:
            print("Please try again.")
            break
        case CBManagerState.resetting:
            print("Please try again.")
            break
        case CBManagerState.unsupported:
            print("This phone does not support bluetooth.")
            break
        case CBManagerState.unauthorized:
            print("Please authorize this app to use Bluetooth.")
            break
        case CBManagerState.poweredOff:
            print("Bluetooth is not turned on.")
            break
        case CBManagerState.poweredOn:
            central.scanForPeripherals(withServices: nil, options: nil)
            break
        }
    }
    
    // Bluetooth: Connect to the device
    private func centralManager(central: CBCentralManager, didDiscoverPeripheral peripheral: CBPeripheral, advertisementData: [String : AnyObject], RSSI: NSNumber) {
        let device = (advertisementData as NSDictionary).object(forKey: CBAdvertisementDataLocalNameKey)
            as? NSString
        
        if device?.contains(BEAN_NAME) == true {
            self.manager.stopScan()
            
            self.peripheral = peripheral
            self.peripheral.delegate = self
            
            manager.connect(peripheral, options: nil)
        }
    }
    
    // Bluetooth: Get services from the device
    func centralManager(central: CBCentralManager, didConnectPeripheral peripheral: CBPeripheral) {
        peripheral.discoverServices(nil)
    }
    
    // Bluetooth: Get Characteristics from the device
    private func peripheral(peripheral: CBPeripheral, didDiscoverServices error: NSError?) {
        for service in peripheral.services! {
            let thisService = service as CBService
            if service.uuid == BEAN_SERVICE_UUID {
                peripheral.discoverCharacteristics(nil, for: thisService)
            }
        }
    }
    
    // Bluetooth: Set up notifications for getting data from the device
    private func peripheral(peripheral: CBPeripheral, didDiscoverCharacteristicsForService service: CBService, error: NSError?) {
        for characteristic in service.characteristics! {
            let thisCharacteristic = characteristic as CBCharacteristic
            if thisCharacteristic.uuid == BEAN_SCRATCH_UUID {
                self.peripheral.setNotifyValue(true, for: thisCharacteristic)
            }
        }
    }
    
    /*
     // Bluetooth: Notification of the updated value for characteristics
     private func peripheral(peripheral: CBPeripheral, didUpdateValueForCharacteristic characteristic: CBCharacteristic, error: NSError?) {
     var count:UInt32 = 0;
     if characteristic.uuid == BEAN_SCRATCH_UUID {
     count = characteristic.value!.getBytes(&count, length: sizeof(UInt32))
     labelCount.text = NSString(format: "%llu", count) as String
     }
     }
     */
}
