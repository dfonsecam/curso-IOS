//
//  LanguagesViewController.swift
//  translade
//
//  Created by Mauricio Rojas Vindas on 1/6/17.
//  Copyright © 2017 Mauricio Rojas Vindas. All rights reserved.
//

import UIKit

protocol LanguagesDelegate: class {
    func closePopover()
    func selectedLanguages(languageType: Constants.LanguageType, languageSelected: String)
}

class LanguagesViewController: UIViewController {

    @IBOutlet weak var languagesPickerView: UIPickerView!
    weak var delegate: LanguagesDelegate?
    var languageType: Constants.LanguageType?
    var languagesArray = [[String:String]]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func languageSelected(_ sender: UIControl) {
        var language = languagesArray[languagesPickerView.selectedRow(inComponent: 0)]
        
        delegate?.selectedLanguages(languageType: languageType!, languageSelected: language[Constants.DIRS_KEY]!)
        //delegate?.closePopover()
        //dismiss(animated: true, completion: nil)
    }
}

extension LanguagesViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return languagesArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return languagesArray[row][Constants.LENGUAGE_KEY]
    }
}
