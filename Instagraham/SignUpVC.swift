//
//  SignUpVC.swift
//  Instagraham
//
//  Created by PHILIP YOO on 6/17/17.
//
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpVC: UIViewController {

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
    

    // MARK: - Navigation
     
     @IBAction func createAccountAction(_ sender: UIButton) {
        if emailField.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Please enter your email and password", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
        } else {
            FIRAuth.auth()?.createUser(withEmail: emailField.text!, password: passwordField.text!) { (user, error) in
                if error == nil {
                    print("You have successfully signed up")
                    
//                    let vc = UIStoryboard(name: "TabBarController", bundle: nil)
                    
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "goToWallVC")
                    self.present(vc!, animated: true, completion: nil)
                } else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
     }
     
}
