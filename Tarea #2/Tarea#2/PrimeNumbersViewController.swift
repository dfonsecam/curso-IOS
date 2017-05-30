//
//  PrimeNumbersViewController.swift
//  Tarea#2
//
//  Created by Diego Fonseca Marín on 5/22/17.
//  Copyright © 2017 Diego Fonseca Marín. All rights reserved.
//

import UIKit

class PrimeNumbersViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var primeNumbers = [Int]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        primeNumbers = getDataSource()
        tableView.registerCustomCell(identifier: PrimeNumberTableViewCell.getCellIdentifier())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getDataSource() -> [Int]  {
        var array = [Int]()
        for number in 1...1000 {
            var isPrime = true            
            if number != 1 {
                for i in 2..<number {
                    if number % i == 0 {
                        isPrime = false
                    }
                }
            }
            if isPrime {
                array.append(number)
            }
        }
        return array
    }
}

extension PrimeNumbersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return primeNumbers.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PrimeNumberTableViewCell
            .getCellIdentifier(), for: indexPath) as! PrimeNumberTableViewCell
        cell.printCell(primeNumber: "\(primeNumbers[indexPath.row])")
        return cell
    }
}

