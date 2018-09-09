//
//  PatientSignUpViewController.swift
//  reMEDI
//
//  Created by Ruhi Kore on 9/8/18.
//  Copyright © 2018 Ruhi Kore. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class PatientSignUpViewController: UIViewController {
    
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var genderTextField: UITextField!
    @IBOutlet var ageTextField: UITextField!
    @IBOutlet var injuriesTextField: UITextField!
    @IBOutlet var allergiesTextField: UITextField!
    @IBOutlet var medicalHistoryTextField: UITextField!
    @IBOutlet var otherInfoTextField: UITextField!
    
    var ref: DatabaseReference!
    var typeOfUser: String = "patient"
    
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
        self.performSegue(withIdentifier: "backSignInSegue", sender: self)
    }
    
    @IBAction func signUpBtnPressed(_ sender: Any) {
        if let email = emailTextField.text, let pass = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: pass, completion: { (user, error) in
                if let u = user {
                    let firstName = self.firstNameTextField.text
                    let lastName = self.lastNameTextField.text
                    let gender = self.genderTextField.text
                    let age = self.ageTextField.text
                    let injuries = self.injuriesTextField.text
                    let allergies = self.allergiesTextField.text
                    let medHistory = self.medicalHistoryTextField.text
                    let otherInfo = self.otherInfoTextField.text
                    
                    var idRef = self.ref.child("patientUsers").childByAutoId()
                    let uid = Auth.auth().currentUser!.uid
                    
                    idRef.setValue(["firstname": firstName, "lastname": lastName, "emailid": email, "typeofpatient": self.typeOfUser, "gender": gender, "age": age, "injuries": injuries, "allergies": allergies, "medHistory": medHistory, "otherInformation": otherInfo, "userID": uid])
                    self.performSegue(withIdentifier: "patientSuccessfulSignUpSegue", sender: self)
                }
            })
        }
    }
}
