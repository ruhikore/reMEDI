//
//  PMyAcct.swift
//  reMEDI
//
//  Created by Ruhi Kore on 9/8/18.
//  Copyright © 2018 Ruhi Kore. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class PMyAcctViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var genderLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var injuriesLabel: UILabel!
    @IBOutlet var allergiesLabel: UILabel!
    @IBOutlet var medHistoryLabel: UILabel!
    @IBOutlet var otherInfoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var ref: DatabaseReference! = Database.database().reference().child("patientUsers")
        
        ref.observe(DataEventType.value, with: {(snapshot) in
            if snapshot.childrenCount > 0 {
                for users in snapshot.children.allObjects as! [DataSnapshot] {
                    let userObject = users.value as? [String: AnyObject]
                    let userFirstName = userObject?["firstname"] as! String
                    let userLastName = userObject?["lastname"] as! String
                    self.nameLabel.text = "Name: \(userFirstName) \(userLastName)"
                    let userGender = userObject?["gender"] as! String
                    self.genderLabel.text = "Gender: \(userGender)"
                    let userAge = userObject?["age"] as! String
                    self.ageLabel.text = "Age: \(userAge)"
                    let userInjuries = userObject?["injuries"] as! String
                    self.injuriesLabel.text = "Any Serious Injuries: \(userInjuries)"
                    let userAllergies = userObject?["allergies"] as! String
                    self.allergiesLabel.text = "Any Allergies: \(userAllergies)"
                    let userMedHistory = userObject?["medHistory"] as! String
                    self.medHistoryLabel.text = "Any Relevant Medical History: \(userMedHistory)"
                    let userOtherInfo = userObject?["otherInformation"] as! String
                    self.otherInfoLabel.text = "Any OtherInformation: \(userOtherInfo)"
                }
            }
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signOutBtnPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "patientSignOutSegue", sender: self)
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "pBackDashboard", sender: self)
        
    }
    
}
