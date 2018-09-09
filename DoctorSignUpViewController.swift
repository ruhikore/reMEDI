//
//  DoctorSignUpViewController.swift
//  reMEDI
//
//  Created by Ruhi Kore on 9/8/18.
//  Copyright © 2018 Ruhi Kore. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class DoctorSignUpViewController: UIViewController {

    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var specializationsTextField: UITextField!
    @IBOutlet var workTextField: UITextField!
    @IBOutlet var educationTextField: UITextField!
    
    var typeOfUser: String = "medical professional"
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "drSignInSegue", sender: self)
    }
    
    @IBAction func signUpBtnPressed(_ sender: Any) {
        if let email = emailTextField.text, let pass = passwordTextField.text {
            Auth.auth().createUser (withEmail: email, password: pass, completion: { (user, error) in
                if let u = user {
                    let firstName = self.firstNameTextField.text
                    let lastName = self.lastNameTextField.text
                    let specializations = self.specializationsTextField.text
                    let workHistory = self.workTextField.text
                    let educationHistory = self.educationTextField.text
                    
                    self.ref.child("doctorUsers").childByAutoId().setValue(["firstname": firstName, "lastname": lastName, "specializations": specializations, "workhistory": workHistory, "educationhistory": educationHistory])
                    self.performSegue(withIdentifier: "drSuccessfulSignUpSegue", sender: self)
                }
            })
        }
    }
    
}
