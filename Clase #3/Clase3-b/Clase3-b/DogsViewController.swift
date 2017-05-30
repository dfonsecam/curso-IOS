//
//  DogsViewController.swift
//  Clase3-b
//
//  Created by Diego Fonseca Marín on 5/16/17.
//  Copyright © 2017 Diego Fonseca Marín. All rights reserved.
//

import UIKit

class DogsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    var dogs = [Dog]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeDataSource()
        tableView.registerCustomCell(identifier: DogTableViewCell.getCellIdentifier())
    }
    
    func initializeDataSource() {
        let dog1 =  Dog(name: "Dog1", color: "Color1", age: "Age1")
        let dog2 =  Dog(name: "Dog2", color: "Color2", age: "Age2")
        let dog3 =  Dog(name: "Dog3", color: "Color3", age: "Age3")
        let dog4 =  Dog(name: "Dog4", color: "Color4", age: "Age4")
        let dog5 =  Dog(name: "Dog5", color: "Color5", age: "Age5")
        dogs = [dog1, dog2, dog3, dog4, dog5]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension DogsViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dogs.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DogTableViewCell
            .getCellIdentifier(), for: indexPath) as! DogTableViewCell
        cell.printCell(dog: dogs[indexPath.row])
        return cell
    }
}
