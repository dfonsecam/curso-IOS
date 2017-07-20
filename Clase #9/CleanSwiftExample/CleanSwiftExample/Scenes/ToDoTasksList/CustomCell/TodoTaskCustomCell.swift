//
//  TodoTaskCustomCell.swift
//  CleanSwiftExample
//
//  Created by Diego Fonseca Marín on 6/6/17.
//  Copyright © 2017 Diego Fonseca Marín. All rights reserved.
//

import UIKit

class TodoTaskCustomCell: UITableViewCell {
    
    @IBOutlet weak var taskTextLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(task: ToDoTasksList.TaskModelCell) {
        taskTextLabel.text = task.text
    }
    
}
