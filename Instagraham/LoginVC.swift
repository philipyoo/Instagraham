//
//  LoginVC.swift
//  Instagraham
//
//  Created by PHILIP YOO on 6/20/17.
//
//

import UIKit
import Firebase
import FirebaseAuth

class LoginVC: UIViewController {
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signInButtonPushed(_ sender: UIButton) {
        if self.emailField.text == "" || self.passwordField.text == "" {
            // Alert to tell user that there was an error because they didn't fill anything in one or both fields
            let alertController = UIAlertController(title: "Error", message: "Please enter an email and password.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
        } else {
            FIRAuth.auth()?.signIn(withEmail: self.emailField.text!, password: self.passwordField.text!) { (user, error) in
                if error == nil {
                    // Print into console if successfully logged in
                    print("You have successfully logged in")
                    
                    // Go to WallVC if login is successful
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "goToWallVC")
                    self.present(vc!, animated: true, completion: nil)
                } else {
                    // Tells user that there is an error and then gets firebase to tell them the error
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }

}
