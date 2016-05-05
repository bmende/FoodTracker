//
//  ViewController.swift
//  FoodTracker
//
//  Created by Benjamin Mende on 5/4/16.
//  Copyright © 2016 Benjamin Mende. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate,
    UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // This will catch text field user input through delegate callbacks
        nameTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Give up focus. Hide keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        mealNameLabel.text = textField.text
    }
    
    // MARK: UIImagePickerControllerDelegate
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        // get rid of picker if user cancels.
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        // info dict contains multiple repr of image, this uses original
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        photoImageView.image = selectedImage
        
        // dismiss image picker.
        dismissViewControllerAnimated(true, completion: nil)
    }

    // MARK: Actions
    @IBAction func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer) {
        // hide keyboard in case user hits image while typing.
        nameTextField.resignFirstResponder()
        
        let imagePickerControler = UIImagePickerController()
        
        // make sure viewcontroller knows when user picks image.
        imagePickerControler.delegate = self
        
        presentViewController(imagePickerControler, animated: true, completion: nil)
        
        
    }
    
    @IBAction func setDefaultLabelText(sender: UIButton) {
        mealNameLabel.text = "Default Text"
    }

}

