//
//  DMyAcctViewController.swift
//  reMEDI
//
//  Created by Ruhi Kore on 9/8/18.
//  Copyright © 2018 Ruhi Kore. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class DMyAcctViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var specializationsLabel: UILabel!
    @IBOutlet var workHistoryLabel: UILabel!
    @IBOutlet var educationHistoryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var ref: DatabaseReference! = Database.database().reference().child("doctorUsers")
        ref.observe(DataEventType.value) { (snapshot) in
            if snapshot.childrenCount > 0 {
                for users in snapshot.children.allObjects as! [DataSnapshot] {
                    let userObject = users.value as? [String: AnyObject]
                    let userFirstName = userObject?["firstname"] as! String
                    let userLastName = userObject?["lastname"] as! String
                    self.nameLabel.text = "Name: \(userFirstName) \(userLastName)"
                    let specializations = userObject?["specializations"] as! String
                    self.specializationsLabel.text = "Specializations: \(specializations)"
                    let work = userObject?["workhistory"] as! String
                    self.workHistoryLabel.text = "Work History: \(work)"
                    let education = userObject?["educationhistory"] as! String
                    self.educationHistoryLabel.text = "Education History: \(education)"
                }
            }
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signOutPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "drSignOutSegue", sender: self)
    }
    
    @IBAction func backPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "drBackDashboard", sender: self)
    }
    
    
    
}
