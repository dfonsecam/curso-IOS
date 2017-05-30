//
//  Category.swift
//  Clase4-a
//
//  Created by Diego Fonseca Marín on 5/18/17.
//  Copyright © 2017 Diego Fonseca Marín. All rights reserved.
//

import UIKit

enum CategoryType {
    case economy, sports, incident, technology
}

class Category: NSObject {
    
    var name : String
    var image: UIImage
    var newArray : [News]
    var type : CategoryType
    
    init(name: String, image: String, type: CategoryType) {
        self.name = name
        self.image = UIImage(named: image)!
        self.newArray = [News]()
        self.type = type
    }

}
