//
//  LoginVC.swift
//  Dindr
//
//  Created by lsecrease on 8/15/15.
//  Copyright (c) 2015 ImagineME. All rights reserved.
//

import UIKit

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
        println("Login Button Pressed")
        loginButton.animation = "pop"
        loginButton.animate()
        
        var username = usernameTextField.text
        var password = passwordTextField.text
        
        passwordTextField.resignFirstResponder()
        
        view.showHUD(view)
        
        PFUser.logInWithUsernameInBackground(usernameTextField.text, password:passwordTextField.text) {
            (user, error) -> Void in
            
            if user != nil { // Login successfull
                self.dismissViewControllerAnimated(true, completion: nil)
                hudView.removeFromSuperview()
                println("Successful Login")
                
            } else { // Login failed. Try again or SignUp
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
extension UIView {
    func showHUD(view: UIView) {
        hudView.center = CGPointMake(view.frame.size.width/2, view.frame.size.height/2)
        hudView.backgroundColor = UIColor.darkGrayColor()
        hudView.alpha = 0.9
        hudView.layer.cornerRadius = hudView.bounds.size.width/2
        
        indicatorView.center = CGPointMake(hudView.frame.size.width/2, hudView.frame.size.height/2)
        indicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.WhiteLarge
        hudView.addSubview(indicatorView)
        indicatorView.startAnimating()
        view.addSubview(hudView)
    }
}
