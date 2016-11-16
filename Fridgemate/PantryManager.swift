//
//  PantryManager.swift
//  Fridgemate
//
//  Created by MakeSchool on 10/26/16.
//  Copyright © 2016 Kadeem. All rights reserved.
//

import Foundation
class PantryManager {
    static let sharedInstance = PantryManager()
    
    var pantryArray = [String]()
    
    var count:Int {
        get {
            return pantryArray.count
        }
    }
    
    func add(item:String) {
    
        pantryArray.append(item)
        save()
    }
    func remove(index:Int) {
        pantryArray.remove(at: index)
        save()
    }
    
    func save() {
        //saves pantryArray to NSUserdefaults
        UserDefaults.standard.set(pantryArray, forKey: "pantryArray")
    }
    func load() {
        //loads pantryArray from nsuserdefaults
        
        //how to apply if let here
        ///
        ///
        ////
        if let pantryArray = UserDefaults.standard.object(forKey: "pantryArray") as? [String] {
            self.pantryArray = pantryArray
        }
        
        
    }
    func clear() {
        pantryArray = []
        save()
    }
    
    init() {
        load()
    }
}
