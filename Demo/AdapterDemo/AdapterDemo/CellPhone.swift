//
//  CellPhone.swift
//  AdapterDemo
//
//  Created by chenghao on 2022/11/11.
//

import Foundation

class CellPhone<T>: CellPhoneProtocol {
    
    var name: String? = nil
    
    var playMusic: String? = nil
    
    var playMovie: String? = nil
    
    var data: T?
    
    init(data: T) {
        self.data = data
    }
    
}
