//
//  Pass Data around!.swift
//  
//
//  Created by Batmanyank on 25/11/20.
//

import Foundation

// Passing Data from ViewController A to ViewController B

// Inside ViewController A
class DataManager {
    static let shared = DataManager()
    var firstVC = ViewControllerA()
}

class ViewControllerA {
    
    // Inside Any Action/ Method use this shared object
    
    DataManager.shared.firstVC.newObjectOfClassB = "New Value"
    
    
}





class ViewControllerB {
    
    var newObjectOfClassB: String! = ""
    
    // Inside View Did Load
    DataManager.shared.firstVC  = self
    
}
