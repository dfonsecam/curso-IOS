//
//  ViewController.swift
//  Translate
//
//  Created by Diego Fonseca Marín on 5/30/17.
//  Copyright © 2017 Diego Fonseca Marín. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class ViewController: UIViewController, NVActivityIndicatorViewable {
    
    @IBOutlet weak var originLangLabel: UILabel!
    @IBOutlet weak var destinationLangLabel: UILabel!
    @IBOutlet weak var originTextView: UITextView!
    @IBOutlet weak var destinationTextView: UITextView!
    
    var languagesArray: [[String: String]]?

    override func viewDidLoad() {
        super.viewDidLoad()
        registerNotifications()
        showActivityIndicator()
        ApiManager.getLanguages()
    }
    
    func registerNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(getLanguagesAvailable)
            , name: Notification.Name(Constants.GET_LANGUAGES_NOTIFICATION), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(errorFound)
            , name: Notification.Name(Constants.ERROR_FOUND_NOTIFICATION), object: nil)
    }
    
    func getLanguagesAvailable(notification: Notification) {
        languagesArray = notification.userInfo![Constants.LANG_KEY] as? [[String: String]]
        hideActivityIndicator()
    }
    
    func errorFound() {
        hideActivityIndicator()
        let alertController = UIAlertController(title: "ERROR FOUND", message: "We found and an error trying to download the languages, please try later", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true)
    }
    
    func showActivityIndicator() {
        DispatchQueue.main.async {
            let size = CGSize(width: 35, height: 35)
            self.startAnimating(size, message: nil, type: NVActivityIndicatorType.pacman)
        }
    }
    
    func hideActivityIndicator() {
        DispatchQueue.main.async {
            self.stopAnimating()
        }
    }
    
    
    @IBAction func originLanguageAction(_ sender: Any) {
        
    }
    
    
    @IBAction func destinationLanguageAction(_ sender: Any) {
        
    }
    
    
    @IBAction func changeLanguageAction(_ sender: Any) {
        
    }
}

