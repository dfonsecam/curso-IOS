//
//  Category.swift
//  Clase4-a
//
//  Created by Diego Fonseca Marín on 5/18/17.
//  Copyright © 2017 Diego Fonseca Marín. All rights reserved.
//

import UIKit

class Category: NSObject {
    
    var name : String
    var image: UIImage
    var newArray : [News]
    
    init(name: String, image: String) {
        self.name = name
        self.image = UIImage(named: image)!
        self.newArray = [News]()
    }

}
