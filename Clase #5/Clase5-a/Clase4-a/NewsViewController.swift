//
//  NewsViewController.swift
//  Clase4-a
//
//  Created by Diego Fonseca Marín on 5/18/17.
//  Copyright © 2017 Diego Fonseca Marín. All rights reserved.
//

import UIKit

protocol NewsViewControllerDelegate: class {
    func addNews(categoryType: CategoryType, news: [News])
}

class NewsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var news : [News]?
    var categoryType : CategoryType?
    
    weak var delegate: NewsViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerCustomCell(identifier: NewsTableViewCell.getIdentifier())
        createAddButton()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let news = news, let categoryType = categoryType {
            delegate?.addNews(categoryType: categoryType, news: news)
        }
    }
    
    func createAddButton() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAction))
        navigationItem.rightBarButtonItem = addButton
    }
    
    func addAction() {
        let viewController = storyboard!.instantiateViewController(withIdentifier:
            NewsDetailTableViewController.getIdentifier()) as! NewsDetailTableViewController
        viewController.delegate = self
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}

extension NewsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let news = news else {
            return 0
        }
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.getIdentifier()) as! NewsTableViewCell
        cell.setupCell(news: news![indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension NewsViewController: NewsDetailTableViewControllerDelegate {
    func addNews(news: News) {
        self.news?.append(news)
        tableView.reloadData()
    }
}
