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
        initializeCategories()
        tableView.registerCustomCell(identifier: CategoryTableViewCell.getIdentifier())
        self.title = "Categorías"
    }
    
    func initializeCategories() {
        let economyCategory = Category(name: "Economía", image: "economy")
        let sportsCategory = Category(name: "Deportes", image: "sports")
        let technologyCategory = Category(name: "Tecnología", image: "technology")
        let incidentCategory = Category(name: "Sucesos", image: "incident")
        categories = [economyCategory, sportsCategory, technologyCategory, incidentCategory]
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
        newsViewController.news = categories[indexPath.row].newArray
        navigationController?.pushViewController(newsViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

}
