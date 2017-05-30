//
//  NumberTableViewController.swift
//  Quiz2
//
//  Created by Diego Fonseca Marín on 5/18/17.
//  Copyright © 2017 Diego Fonseca Marín. All rights reserved.
//

import UIKit

class NumberTableViewController: UITableViewController {

    var dataSource = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = loadDataSource()
        tableView.registerCustomCell(identifier: NumberTableViewCell.getCellIdentifier())
    }
    
    
    func loadDataSource() -> [Int] {
        var array = [Int]()
        for index in 1...100 {
            array.append(index)
        }
        return array
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NumberTableViewCell.getCellIdentifier(), for: indexPath) as! NumberTableViewCell
        let value  = dataSource[indexPath.row]
        cell.printCell(number: value)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
}
