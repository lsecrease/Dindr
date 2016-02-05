//
//  PaymentViewController.swift
//  Dindr
//
//  
//  Copyright © 2016. All rights reserved.
//

import UIKit
import Spring
import Stripe
import AFNetworking

class PaymentViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var paymentView: DesignableView!
    @IBOutlet weak var emailTextField: DesignableTextField!
    @IBOutlet weak var cardNumberTextField: DesignableTextField!
    @IBOutlet weak var expireDateTextField: DesignableTextField!
    @IBOutlet weak var cvcTextField: DesignableTextField!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var amountLabel: UILabel!
    
    
    //var amount: Int = 300
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        return true
    }
    
    func handleError(error: NSError) {
        UIAlertView(title: "Please Try Again", message: error.localizedDescription, delegate: nil, cancelButtonTitle: "OK").show()
    }
    
    
    @IBAction func closeButtonDidTouch(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
   
    @IBAction func payButtonTapped(sender: AnyObject) {
        
        paymentView.animation = "shake"
        paymentView.animate()
        
        var stripCard = STPCard()
        
        if self.expireDateTextField.text?.isEmpty == false {
            let expirationDate = self.expireDateTextField.text?.componentsSeparatedByString("/")
                let expMonth = UInt(Int(expirationDate![0])!)
                let expYear = UInt(Int(expirationDate![1])!)
            
                stripCard.number = self.cardNumberTextField.text
                stripCard.cvc = self.cvcTextField.text
                stripCard.expMonth = expMonth
                stripCard.expYear = expYear
            
        }
        var underlyingError: NSError?
        //stripCard.validateCardReturningError(&underlyingError)
        if underlyingError != nil {
            self.handleError(underlyingError!)
            return
        }
        
        STPAPIClient.sharedClient().createTokenWithCard(stripCard) { (token, error) -> Void in
            if error != nil {
                self.handleError(error!)
                return
            }
            
            //self.postStripeToken(token!)
        }
        
        
    }
    
//    
//    func postStripeToken(token: STPToken) {
//        
//        let URL = "http://localhost/donate/payment.php"
//        let params = ["stripeToken": token.tokenId,
//            "amount": self.amountTextField.text.toInt()!,
//            "currency": "usd",
//            "description": self.emailTextField.text]
//        
//        let manager = AFHTTPRequestOperationManager()
//        manager.POST(URL, parameters: params, success: { (operation, responseObject) -> Void in
//            
//            if let response = responseObject as? [String: String] {
//                UIAlertView(title: response["status"],
//                    message: response["message"],
//                    delegate: nil,
//                    cancelButtonTitle: "OK").show()
//            }
//            
//            }) { (operation, error) -> Void in
//                self.handleError(error!)
//        }
//
//
//}
}