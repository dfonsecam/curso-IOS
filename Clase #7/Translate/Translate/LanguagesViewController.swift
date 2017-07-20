//
//  LanguagesViewController.swift
//  Translate
//
//  Created by Diego Fonseca Marín on 6/1/17.
//  Copyright © 2017 Diego Fonseca Marín. All rights reserved.
//

import UIKit

class LanguagesViewController: UIViewController {

    @IBOutlet weak var languagesPickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func selectLangAction(_ sender: UIButton) {
    }
}

extension LanguagesViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 0
    }
}
