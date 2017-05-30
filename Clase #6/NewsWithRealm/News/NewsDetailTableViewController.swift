//
//  NewsDetailTableViewController.swift
//  News
//
//  Created by Cesar Brenes on 5/23/17.
//  Copyright © 2017 César Brenes Solano. All rights reserved.
//

import UIKit


class NewsDetailTableViewController: UITableViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    var categoryType: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSaveNews()
    }

    func addSaveNews() {
        let saveAction = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveNewsAction))
        navigationItem.rightBarButtonItem = saveAction
    }
    
    func saveNewsAction() {
        RealmManager.createNews(categoryType: categoryType!, title: titleTextField.text!, description: descriptionTextView.text!)
//        let news = News(titleNews: titleTextField.text!, descriptionNews: descriptionTextView.text!, createdAt: Date())
//        delegate?.addNews(news: news)
        navigationController?.popViewController(animated: true)
    }
}
