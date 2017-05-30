//
//  NameViewController.swift
//  Clase2-a
//
//  Created by Diego Fonseca Marín on 5/11/17.
//  Copyright © 2017 Diego Fonseca Marín. All rights reserved.
//

import UIKit

class NameViewController: UIViewController {
    
    var name : String?

    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = "Bienvenido \n \(name!)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
