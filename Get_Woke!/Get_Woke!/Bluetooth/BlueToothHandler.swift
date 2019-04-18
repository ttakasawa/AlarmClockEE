//
//  BlueToothHandler.swift
//  Get_Woke!
//
//  Created by Tomoki Takasawa on 4/16/19.
//  Copyright © 2019 Mike. All rights reserved.
//

import Foundation
import CoreBluetooth


protocol BlueToothHandler {
    func activate()
    func deactivate()
    
}

//CBCentralManagerDelegate, CBPeripheralDelegate
extension BlueToothHandler where Self: CBCentralManagerDelegate {
    func initialize(){
        var centralManager: CBCentralManager!
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }
    
}

extension BlueToothHandler where Self: CBPeripheralDelegate {
    
}
// NOTE: Mike, you guys need to implement Bluetooth stuff here.
extension BlueToothHandler {
    func activate() {
        var centralManager: CBCentralManager!
        
        
    }
//
//    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
//
//        let deviceName = ""
//        var manager: CBCentralManager!
//        var device: CBPeripheral?
//        var characteristics: [CBCharacteristic]?
//        var serviceUUID = "1234"
//        var char1 = "FFE1"
//        
//        if let peripheralName = advertisementData[CBAdvertisementDataLocalNameKey] as? String {
//
//            if peripheralName == deviceName {
//
//                // save a reference to the sensor tag
//                device = peripheral
//                device!.delegate = self
//
//                // Request a connection to the peripheral
//
//                manager.connect(device, options: nil)
//
//                print("Check")
//            }
//        }
//    }
    
    func deactivate() {
        
    }
}
