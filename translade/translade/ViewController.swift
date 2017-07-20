//
//  ViewController.swift
//  translade
//
//  Created by Mauricio Rojas Vindas on 30/5/17.
//  Copyright © 2017 Mauricio Rojas Vindas. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class ViewController: UIViewController, NVActivityIndicatorViewable {

    @IBOutlet weak var origenTextView: UITextView!
    @IBOutlet weak var destinationTextView: UITextView!

    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var destinationLabel: UILabel!
    
    var languagesArray : [[String: String]]?
    var originLanguage : String?
    var destinationLanguage : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showActivityIndicator()
        
        registerNotifications()
        APIManager.getLanguages()
    }

    func registerNotifications(){
        NotificationCenter.default.addObserver(self, selector: #selector (getLanguagesAvailable(notification:)), name: Notification.Name( Constants.GET_LENGUAGES_NOTIFICATION), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector (errorFound), name: Notification.Name( Constants.ERROR_FOUND_NOTIFICATION), object: nil)
    }
    
    
    func getLanguagesAvailable(notification: Notification){
        languagesArray = notification.userInfo![Constants.LENGUAGE_KEY] as? [[String: String]]
        //print("EL TAMAÑO  DEL ARRAY ES DE \(languagesArray.count)")
        hideActivityIndicador()
    }
    
    func errorFound()
    {
        hideActivityIndicador()
        let alertController = UIAlertController(title: "Error found", message: "We found an error trying to download the languages, please try later", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion:  nil)
    }
    
    func showActivityIndicator(){
        DispatchQueue.main.async {
            let size = CGSize(width: 35, height: 35)
            self.startAnimating(size,message: nil, type: NVActivityIndicatorType.orbit)
        }
    }
    func hideActivityIndicador(){
        DispatchQueue.main.async {
            self.stopAnimating()
        }
    }

    @IBAction func trasladeButton(_ sender: UIButton) {
        view.endEditing(true)
        
        if (originLanguage ?? "").isEmptyOrWhitespace(), (destinationLanguage ?? "").isEmptyOrWhitespace(), origenTextView.text!.isEmptyOrWhitespace(){
            print("En Blanco")
        }
        else{
            showActivityIndicator()
            APIManager.createTranslade(originalLanguage: originLanguage!, destinationLanguage: destinationLanguage!, textToTranslate: origenTextView.text!){ (textTranslade) in
                self.hideActivityIndicador()
                self.destinationTextView.text = textTranslade!
            }
        }
    }
    
    @IBAction func origenLanguageAction(_ sender: Any) {
        presentLanguageController(languageType: Constants.LanguageType.origin)
    }
    @IBAction func destinationLanguageAction(_ sender: Any) {
        presentLanguageController(languageType: Constants.LanguageType.destination)
    }
    @IBAction func changeLanguageAction(_ sender: Any) {
        let _back = originLanguage

        originLanguage = destinationLanguage
        destinationLanguage = _back
        
        updateLanguagesLabel()
    }

    func presentLanguageController(languageType: Constants.LanguageType)
    {
        let languagesViewController = storyboard?.instantiateViewController(withIdentifier: "LanguagesViewController") as! LanguagesViewController
        languagesViewController.modalPresentationStyle = .overCurrentContext
        languagesViewController.delegate = self
        languagesViewController.languageType = languageType
        languagesViewController.languagesArray = languagesArray!
        present(languagesViewController, animated: true, completion: nil)
    }
    
    func updateLanguagesLabel()
    {
        originLabel.text = originLanguage?.uppercased()
        destinationLabel.text = destinationLanguage?.uppercased()
    }
}

extension ViewController: LanguagesDelegate{
    func closePopover() {
        dismiss(animated: true, completion: nil)
    }
    func selectedLanguages(languageType: Constants.LanguageType, languageSelected: String) {
        closePopover()
        
        switch languageType {
        case .origin:
            originLanguage = languageSelected
        case .destination:
            destinationLanguage = languageSelected
        }
        
        updateLanguagesLabel()
        
//        if languageType == Constants.LanguageType.origin {
//            originLanguage = languageSelected
//            originLabel.text = originLanguage?.uppercased()
//        }
//        if languageType == Constants.LanguageType.destination {
//            destinationLanguage = languageSelected
//            destinationLabel.text = destinationLanguage?.uppercased()
//        }
    }
}

extension String{
    func isEmptyOrWhitespace() -> Bool{
        return self.trimmingCharacters(in: CharacterSet.whitespaces).isEmpty
    }
}

