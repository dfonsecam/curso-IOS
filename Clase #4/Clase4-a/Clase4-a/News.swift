//
//  News.swift
//  Clase4-a
//
//  Created by Diego Fonseca Marín on 5/18/17.
//  Copyright © 2017 Diego Fonseca Marín. All rights reserved.
//

import UIKit

class News: NSObject {
    
    var titleNews : String
    var descriptionNews: String
    var createdAt : NSDate
    
    init(titleNews: String, descriptionNews: String, createdAt: NSDate) {
        self.titleNews = titleNews
        self.descriptionNews = descriptionNews
        self.createdAt = createdAt
    }
    
}
