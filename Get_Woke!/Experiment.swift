//
//  Experiment.swift
//  Get_Woke!
//
//  Created by Tomoki William Takasawa on 4/17/19.
//  Copyright © 2019 Mike. All rights reserved.
//

import UIKit
import CoreBluetooth

class qViewController: UIViewController, CBCentralManagerDelegate, CBPeripheralDelegate {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        //placeholder
    }
    
    
    
    //references to central manager
    let hmBleService = "FFE0"
    let writeCHAR = "FFE1"
    
    var centralManager: CBCentralManager!
    var connectedPeripheral: CBPeripheral!
    var writeCharacteristic: CBCharacteristic!
    
    
    //OUTLETS
    
    @IBOutlet weak var shadowView: UIView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var uiSwitch: UISwitch!
    
    @IBAction func uiSwitchValueChanged(_ sender: UISwitch) {
        
        if(sender.isOn){
            
            print("Switch is ON")
            let dataA = "R".data(using: .utf8)
            connectedPeripheral.writeValue(dataA!, for: writeCharacteristic, type: CBCharacteristicWriteType.withResponse)
            //writeBLEData(string: "R")
        }
        else{
            print("Switch is OFF")
            let dataB = "r".data(using: .utf8)
            connectedPeripheral.writeValue(dataB!, for: writeCharacteristic, type: CBCharacteristicWriteType.withResponse)
            //   writeBLEData(string: "r")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        centralManager = CBCentralManager(delegate: self, queue:nil)
        
    }
    //Functions added
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //Attempt to make BLE Connection
        Timer.scheduledTimer(timeInterval: 1.0, target: self,selector: #selector(scanForBLEdevice), userInfo: nil, repeats: false)
        
        activityIndicator.startAnimating()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        //CLose BLE Connection if it exists
    }
    
    
    
    @objc func scanForBLEdevice(){
        
        centralManager.scanForPeripherals(withServices: [CBUUID(string:hmBleService)], options: nil)
        
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        if(peripheral.name != nil){
            print("Found Peripheral name = \(peripheral.name!)")
        }
        else{
            print("Found Peripheral with unknown name")
        }
        
        //Save reference to the peripheral
        connectedPeripheral = peripheral
        
        centralManager.stopScan()
        
        centralManager.connect(connectedPeripheral, options: nil)
        
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        print("Connected to the device !")
        
        hideActivityIndicator()
        
        connectedPeripheral.delegate = self
        
        connectedPeripheral.discoverServices(nil)
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        print("Service = \(String(describing: peripheral.services!.count))")
        for service in peripheral.services!{
            print("Servicee = \(service)")
            
            let aService = service as CBService
            if service.uuid == CBUUID(string: hmBleService){
                // Discover characteristics for our service
                peripheral.discoverCharacteristics(nil, for: aService)
                
            }
            
        }
        
    }
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        
        for characteristic in service.characteristics!{
            let aCharacteristic = characteristic as CBCharacteristic
            
            if aCharacteristic.uuid == CBUUID(string: writeCHAR){
                print("We found our write Characteristic")
                writeCharacteristic = aCharacteristic
            }
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Central Manager Delegates
    
    
    
    
}
