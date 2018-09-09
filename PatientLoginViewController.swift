//
//  PatientLoginViewController.swift
//  reMEDI
//
//  Created by Ruhi Kore on 9/8/18.
//  Copyright © 2018 Ruhi Kore. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class PatientLoginViewController: UIViewController {
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "backToMainScreenSegue", sender: self)
    }
    
    @IBAction func signInBtnPressed(_ sender: Any) {
        if let email = emailTextField.text, let pass = passwordTextField.text {
            
            Auth.auth().signIn(withEmail: email, password: pass, completion: { (user, error) in
                
                if let u = user {
                    //if user is found, go to the dashboard
                    self.performSegue(withIdentifier: "patientSuccessfulSignInSegue", sender: self)
                }
                else {
                    //if user isn't found, display an error message
                }
            })
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    
    @IBAction func signUpBtnPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "patientSignUpSegue", sender: self)
        
    }
    
    
    
}
