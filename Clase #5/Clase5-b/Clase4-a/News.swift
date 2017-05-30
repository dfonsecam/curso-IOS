//
//  News.swift
//  Clase4-a
//
//  Created by Diego Fonseca Marín on 5/18/17.
//  Copyright © 2017 Diego Fonseca Marín. All rights reserved.
//

//import UIKit
import RealmSwift

class News: Object {
    
    dynamic var titleNews = ""
    dynamic var descriptionNews = ""
    dynamic var createdAt = Date()
    dynamic var category: Category?
}
