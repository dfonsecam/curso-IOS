//
//  ViewController.swift
//  Clase2-a
//
//  Created by Diego Fonseca Marín on 5/11/17.
//  Copyright © 2017 Diego Fonseca Marín. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func saludarAction(_ sender: Any) {
        
        if let name = nameTextField.text {
            print("El nombre es \(name)")
        }
        
        let nameViewController = (storyboard?.instantiateViewController(
            withIdentifier: "NameViewController")
        )! as! NameViewController
        navigationController?.pushViewController(nameViewController, animated: true)
        
        nameViewController.name = nameTextField.text
        
//        let alertController = UIAlertController(title: "Información", message: "Usted presionó el botón",
//                                                preferredStyle: .alert)
//        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
//        alertController.addAction(action)
//        present(alertController, animated: true, completion: nil)
    }
}

