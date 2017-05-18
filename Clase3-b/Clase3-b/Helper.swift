//
//  Helper.swift
//  Clase3-b
//
//  Created by Diego Fonseca Marín on 5/16/17.
//  Copyright © 2017 Diego Fonseca Marín. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    func registerCustomCell(identifier: String) {
        let nib = UINib(nibName: identifier, bundle: nil)
        self.register(nib, forCellReuseIdentifier: identifier)
    }
}

extension UITableViewCell {
    class func getCellIdentifier() -> String {
        return String(describing: self)
    }
}
