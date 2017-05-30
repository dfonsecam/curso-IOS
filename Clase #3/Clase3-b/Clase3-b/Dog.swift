//
//  Dog.swift
//  Clase3-b
//
//  Created by Diego Fonseca Marín on 5/16/17.
//  Copyright © 2017 Diego Fonseca Marín. All rights reserved.
//

import UIKit

class Dog: NSObject {
    
    var name: String
    var color: String
    var age: String
    
    init(name: String, color: String, age: String) {
        self.name = name
        self.color = color
        self.age = age
    }
}
