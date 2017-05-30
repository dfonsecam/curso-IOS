//
//  RealmManager.swift
//  Tarea #3
//
//  Created by Felipe Soto Campos on 5/28/17.
//  Copyright © 2017 PIPO. All rights reserved.
//


import UIKit
import RealmSwift

class RealmManager: NSObject {
    
    class func getAllDogs() -> Results<Dogs>? {
        let realm = try! Realm()
        let allDogs = realm.objects(Dogs.self)
        if allDogs.count > 0 {
            return allDogs
        }
        else {
            return nil
        }
    }
    
    private class func addObjectToRealm(realmObject: Object) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(realmObject)
        }
    }
    
    class func createDog(name: String, color: String, data: NSData) {
        let allDogs = getAllDogs()
        let dog = Dogs()
        dog.name = name
        dog.color = color
        dog.imageData = data
        if allDogs == nil {
            dog.orden = 1
        } else {
            dog.orden = allDogs!.count + 1
        }
        addObjectToRealm(realmObject: dog)
    }
    
}
