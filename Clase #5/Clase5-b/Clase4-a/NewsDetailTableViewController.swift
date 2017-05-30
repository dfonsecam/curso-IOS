//
//  NewsDetailTableViewController.swift
//  Clase5-a
//
//  Created by Diego Fonseca Marín on 5/23/17.
//  Copyright © 2017 Diego Fonseca Marín. All rights reserved.
//

import UIKit

protocol NewsDetailTableViewControllerDelegate: class {
    func addNews(news: News)
}

class NewsDetailTableViewController: UITableViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    weak var delegate: NewsDetailTableViewControllerDelegate?
    
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
//        let news = News(titleNews: titleTextField.text!, descriptionNews: descriptionTextView.text!, createdAt: Date())
//        delegate?.addNews(news: news)
    }
}
