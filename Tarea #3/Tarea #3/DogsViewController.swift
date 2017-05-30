//
//  DogsViewController.swift
//  Tarea #3
//
//  Created by Felipe Soto Campos on 5/28/17.
//  Copyright © 2017 PIPO. All rights reserved.
//

import UIKit
import RealmSwift

class DogsViewController: UIViewController {

    var dogs: Results<Dogs>?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Dogs"
        goToAddDog()
        tableView.registerCustomCell(identifier: DogTableViewCell.getCellIdentifier())
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initializeDogs()
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func initializeDogs() {
        dogs = RealmManager.getAllDogs()
    }
    
    func goToAddDog() {
        let addBUtton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(goToAction))
        navigationItem.rightBarButtonItem = addBUtton
    }
    
    func goToAction() {
        let viewController = storyboard!.instantiateViewController(withIdentifier: AddDogViewController.getUIViewControllerIdentifier()) as! AddDogViewController
        navigationController?.pushViewController(viewController, animated: true)
    }

}

extension DogsViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DogTableViewCell.getCellIdentifier()) as! DogTableViewCell
        let dog = dogs![indexPath.row]
        cell.lblName.text = dog.name
        cell.lblColor.text = dog.color
        let image : UIImage = UIImage(data: dog.imageData as Data)!
        cell.imgView.image = image
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let dogs = dogs else {
            return 0
        }
        return dogs.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
}
