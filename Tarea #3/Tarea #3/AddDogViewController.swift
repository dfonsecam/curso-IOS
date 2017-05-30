//
//  AddDogViewController.swift
//  Tarea #3
//
//  Created by Felipe Soto Campos on 5/28/17.
//  Copyright © 2017 PIPO. All rights reserved.
//

import UIKit

class AddDogViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtColor: UITextField!
    
    var imageData = NSData()
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        self.title = "Add Dog"
        addDog()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func addDog() {
        let addBUtton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(addAction))
        addBUtton.isEnabled = false
        navigationItem.rightBarButtonItem = addBUtton
    }
    
    func addAction() {
        if(validatedFiled()) {
            RealmManager.createDog(name: txtName.text!, color: txtColor.text!, data: imageData)
            navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func addImgDog(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageData = (UIImagePNGRepresentation(image) as NSData?)!
            navigationItem.rightBarButtonItem?.isEnabled = true
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    func validatedFiled() -> Bool {
        if txtName.text! .isEmpty {
            displayAlert(pMessage: "Favor ingresar un nombre")
            return false
        }
        if txtColor.text! .isEmpty {
            displayAlert(pMessage: "Favor ingresar un color")
            return false
        }
        return true
    }
    
    func displayAlert(pMessage: String?) {
        let alertController = UIAlertController(title: "Error", message: pMessage, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true)
    }

}
