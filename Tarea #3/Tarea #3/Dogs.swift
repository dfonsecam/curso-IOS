//
//  Dogs.swift
//  Tarea #3
//
//  Created by Felipe Soto Campos on 5/28/17.
//  Copyright © 2017 PIPO. All rights reserved.
//

import UIKit
import RealmSwift

class Dogs: Object {
    dynamic var name = ""
    dynamic var color = ""
    dynamic var imageData = NSData()
    dynamic var orden = 0
}
