//
//  RealmManager.swift
//  Clase5-b
//
//  Created by Diego Fonseca Marín on 5/25/17.
//  Copyright © 2017 Diego Fonseca Marín. All rights reserved.
//

import UIKit
import RealmSwift

class RealmManager: NSObject {

    func getAllCategories() -> Results<Category> {
        let realm = try! Realm()
        let categories = realm.objects(Category.self)
    }
    
}
