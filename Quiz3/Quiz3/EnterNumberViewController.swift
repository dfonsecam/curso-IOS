//
//  EnterNumberViewController.swift
//  Quiz3
//
//  Created by Diego Fonseca Marín on 5/23/17.
//  Copyright © 2017 Diego Fonseca Marín. All rights reserved.
//

import UIKit

class EnterNumberViewController: UIViewController {

    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var values = [String]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerCustomCell(identifier: NumberCustomCell.getCellIdentifier())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addAction(_ sender: Any) {
        view.endEditing(true)
        if let value = numberTextField.text {
            values.append(value)
            tableView.reloadData()
            numberTextField.text = ""
        }
    }
}

extension EnterNumberViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return values.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NumberCustomCell
            .getCellIdentifier(), for: indexPath) as! NumberCustomCell
        cell.numberLabel.text = values[indexPath.row]
        return cell
    }
}

