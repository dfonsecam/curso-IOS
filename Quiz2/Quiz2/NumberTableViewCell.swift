//
//  NumberTableViewCell.swift
//  Quiz2
//
//  Created by Diego Fonseca Marín on 5/18/17.
//  Copyright © 2017 Diego Fonseca Marín. All rights reserved.
//

import UIKit

class NumberTableViewCell: UITableViewCell {

    @IBOutlet weak var numberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func printCell(number : Int) {
        numberLabel.text = "\(number)"
        if number % 2 == 0 {
            contentView.backgroundColor = UIColor.red
        }
        else{
            contentView.backgroundColor = UIColor.blue
        }
    }
}
