//
//  Category.swift
//  Clase4-a
//
//  Created by Diego Fonseca Marín on 5/18/17.
//  Copyright © 2017 Diego Fonseca Marín. All rights reserved.
//

//import UIKit
import RealmSwift


//enum CategoryType {
//    case economy, sports, incident, technology
//}

class Category: Object {
    
    dynamic var name = ""
    dynamic var image = ""
    let news = List<News>()
}
