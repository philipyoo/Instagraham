//
//  ViewController.swift
//  Instagraham
//
//  Created by PHILIP YOO on 6/17/17.
//
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var loginButton: UIButton!
    @IBAction func loginSubmit(_ sender: UIButton)
    {
        if emailField.text != "" && passwordField != ""
        {
            if segmentControl.selectedSegmentIndex == 0   // Login User
            {
                FIRAuth.auth()?.signIn(withEmail: emailField!, password: passwordField!, completion: { (user, error) in
                    if user != nil {
                        
                    } else {
                        if let myError = error?.localizedDescription {
                            print(myError)
                        } else {
                            
                        }
                    }
                })
            }
            else  // Register User
            {
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

