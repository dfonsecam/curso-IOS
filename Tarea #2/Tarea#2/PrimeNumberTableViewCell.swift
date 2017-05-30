//
//  PrimeNumberTableViewCell.swift
//  Tarea#2
//
//  Created by Diego Fonseca Marín on 5/22/17.
//  Copyright © 2017 Diego Fonseca Marín. All rights reserved.
//

import UIKit

class PrimeNumberTableViewCell: UITableViewCell {
    
    @IBOutlet weak var primeNumberLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func printCell(primeNumber: String) {
        primeNumberLabel.text = primeNumber
    }    
}
