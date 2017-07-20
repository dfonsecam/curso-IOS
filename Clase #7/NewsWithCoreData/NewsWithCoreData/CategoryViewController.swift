//
//  CategoryViewController.swift
//  Clase4-a
//
//  Created by Diego Fonseca Marín on 5/18/17.
//  Copyright © 2017 Diego Fonseca Marín. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var categories = [Category]()

    override func viewDidLoad() {
        super.viewDidLoad()
        categories = CoreDataManager.getAllCategories()
        tableView.registerCustomCell(identifier: CategoryTableViewCell.getIdentifier())
        self.title = "Categorías"
    }
}

extension CategoryViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.getIdentifier()) as! CategoryTableViewCell
        cell.setupCell(category: categories[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newsViewController = storyboard?.instantiateViewController(withIdentifier:
            NewsViewController.getIdentifier()) as! NewsViewController
        newsViewController.category = categories[indexPath.row]
//        newsViewController.news = categories[indexPath.row].newArray
//        newsViewController.categoryType = categories[indexPath.row].type
        navigationController?.pushViewController(newsViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
