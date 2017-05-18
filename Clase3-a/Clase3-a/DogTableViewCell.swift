//
//  DogTableViewCell.swift
//  Clase3-a
//
//  Created by Diego Fonseca Marín on 5/16/17.
//  Copyright © 2017 Diego Fonseca Marín. All rights reserved.
//

import UIKit

class DogTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
