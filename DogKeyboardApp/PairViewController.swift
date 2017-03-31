//
//  ViewController.swift
//  DogKeyboardApp
//
//  Created by Sanny Chun  & Hyunsu Park on 3/12/17.
//  Copyright © 2017 TeamSupreme. All rights reserved.
//

import UIKit
import CoreBluetooth

class PairViewController: UIViewController, CBCentralManagerDelegate, CBPeripheralDelegate {
    
    // MARK: Properties
    // Bluetooth: variables
    var manager: CBCentralManager!
    var peripheral: CBPeripheral!
    
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Bluetooth Pairing
    @IBAction func pairKeyboard(_ sender: Any) {
        centralManagerDidUpdateState(manager)
    }
    
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

