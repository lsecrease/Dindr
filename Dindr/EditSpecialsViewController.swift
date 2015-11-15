//
//  EditSpecialsViewController.swift
//  Dindr
//
//  Created by Lawrence Olivier on 11/14/15.
//  Copyright © 2015 ImagineME. All rights reserved.
//

import UIKit

class EditSpecialsViewController: UIViewController {

    @IBOutlet weak var perkDescriptionTextView: UITextView!
    
    @IBOutlet var hideKeyboardInputAccessoryView: UIView!
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         perkDescriptionTextView.inputAccessoryView = hideKeyboardInputAccessoryView

        perkDescriptionTextView.becomeFirstResponder()
        //perkDescriptionTextView.delegate = self
       
        
        // handle text view
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
    }
    
    @IBAction func hideKeyboard()
    {
        if perkDescriptionTextView.isFirstResponder() {
            perkDescriptionTextView.resignFirstResponder()
        }
    }


    // MARK: - Text View Handler
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func keyboardWillShow(notification: NSNotification)
    {
        let userInfo = notification.userInfo ?? [:]
        let keyboardSize = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).CGRectValue().size
        
        self.perkDescriptionTextView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        self.perkDescriptionTextView.scrollIndicatorInsets = self.perkDescriptionTextView.contentInset
    }
    
    func keyboardWillHide(notification: NSNotification)
    {
        self.perkDescriptionTextView.contentInset = UIEdgeInsetsZero
        self.perkDescriptionTextView.scrollIndicatorInsets = UIEdgeInsetsZero
    }
    


}



