//
//  NewsDetailTableViewController.swift
//  Clase5-a
//
//  Created by Diego Fonseca Marín on 5/23/17.
//  Copyright © 2017 Diego Fonseca Marín. All rights reserved.
//

import UIKit

class NewsDetailTableViewController: UITableViewController {
    
    var category : Category?

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createSaveButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func createSaveButton() {
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveNewsAction))
        navigationItem.rightBarButtonItem = saveButton
    }
    
    func saveNewsAction() {
        CoreDataManager.addNews(category: category!, title: titleTextField.text!,
                                descriptionNews: descriptionTextView.text!)
        navigationController?.popViewController(animated: true)
    }    
}
