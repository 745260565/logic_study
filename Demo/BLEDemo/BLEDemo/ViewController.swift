//
//  ViewController.swift
//  BLEDemo
//
//  Created by chenghao on 2022/10/8.
//

import UIKit
import CoreBluetooth

class ViewController: UIViewController {
    
    var centerManager: CBCentralManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let centerQueue = DispatchQueue.init(label: "centralQueue")
        centerManager = CBCentralManager.init(delegate: self, queue: nil, options:nil)

//        centerManager = CBCentralManager.init(delegate: self, queue: nil, options: [CBCentralManagerOptionShowPowerAlertKey: true,CBCentralManagerOptionRestoreIdentifierKey: "unique identifier"])
//        peripheralManager = CBPeripheralManager(delegate: self, queue: nil)
//        peripheralManager?.startAdvertising([CBAdvertisementDataServiceUUIDsKey:[TextOrMapServiceUUID]])
        // Do any additional setup after loading the view.
    }


}

extension ViewController: CBCentralManagerDelegate {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .unknown:
            print("未知状态")
        case .resetting:
            print("重置状态")
        case .unsupported:
            print("不支持的状态")
        case .unauthorized:
            print("未授权的状态")
        case .poweredOff:
            print("关闭状态")
        case .poweredOn:
            print("开启状态")
//            centerManager?.scanForPeripherals(withServices: nil, options: nil)
//
            centerManager?.scanForPeripherals(withServices: nil, options: [CBCentralManagerScanOptionAllowDuplicatesKey:NSNumber(value: false as Bool),CBCentralManagerOptionShowPowerAlertKey:true])
        @unknown default:
            break
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        guard let name = peripheral.name else {
           return
        }
        print(name)
//        print(advertisementData)
//        print(RSSI)
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        
    }
    
    func centralManager(_ central: CBCentralManager, willRestoreState dict: [String : Any]) {
        
    }
    
}
