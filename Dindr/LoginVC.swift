//
//  LoginVC.swift
//  Dindr
//
//  Created by lsecrease on 8/15/15.
//  Copyright (c) 2015. All rights reserved.
//

import UIKit
import Spring
import Parse

class LoginVC: UIViewController, UITextFieldDelegate, UIAlertViewDelegate {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: DesignableButton!
    
    override func viewWillAppear(animated: Bool) {
        if PFUser.currentUser() != nil {
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func loginButtonPressed(sender: AnyObject) {
        print("Login Button Pressed")
        //loginButton.animation = "pop"
        //loginButton.animate()
        
        guard let username = usernameTextField.text, password = passwordTextField.text else {
            // TODO: add alert
            showAlertWithMessage("Please fill in both username and password fields")
            return
        }
        
        passwordTextField.resignFirstResponder()
        
        //view.showHUD(view)
        
        PFUser.logInWithUsernameInBackground(username, password:password) {
            (user, error) -> Void in
            
            if user != nil { // Login successfull
                self.dismissViewControllerAnimated(true, completion: nil)
                hudView.removeFromSuperview()
                print("Successful Login")
                
                //Add Restaurant
                let rest = PFObject(className: "User")
                rest["isRestaurant"] = true
                rest.saveInBackgroundWithBlock {
                    (success: Bool, error: NSError?) -> Void in
                    if (success) {
                        // The object has been saved.
                    } else {
                        // There was a problem, check error.description
                    }
                }
                
            } else { // Login failed. Try again or SignUp
                // TODO: update this to use UIAlertController
                let alert = UIAlertView(title: "Dindr",
                    message: "\(error!.localizedDescription)",
                    delegate: self,
                    cancelButtonTitle: "Retry",
                    otherButtonTitles: "Sign Up")
                alert.show()
                
                hudView.removeFromSuperview()
            }
        }
    }
    

    func showAlertWithMessage(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .Alert)
        
        let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        
        alert.addAction(okAction)
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    
    /*  MARK - TEXTFIELD DELEGATES  */
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == usernameTextField {
            passwordTextField.becomeFirstResponder()
        }
        if textField == passwordTextField  {
            loginButtonPressed(self)
            passwordTextField.resignFirstResponder()
        }
        return true
    }
    
    // TAP TO DISMISS KEYBOARD
    @IBAction func tapToDismissKeyboard(sender: UITapGestureRecognizer) {
        usernameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }



}

let hudView = UIView(frame: CGRectMake(0, 0, 80, 80))
let indicatorView = UIActivityIndicatorView(frame: CGRectMake(0, 0, 80, 80))
let spinImage = UIImageView(frame: CGRectMake(0, 0, 80, 80))


//extension UIView {
//    func showHUD(view: UIView) {
//        hudView.center = CGPointMake(view.frame.size.width/2, view.frame.size.height/2)
//        hudView.backgroundColor = UIColor.darkGrayColor()
//        hudView.alpha = 0.9
//        hudView.layer.cornerRadius = hudView.bounds.size.width/2
//        
//        indicatorView.center = CGPointMake(hudView.frame.size.width/2, hudView.frame.size.height/2)
//        indicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.WhiteLarge
//        hudView.addSubview(indicatorView)
//        indicatorView.startAnimating()
//        view.addSubview(hudView)
//    }
//}
