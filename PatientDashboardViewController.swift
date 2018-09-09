//
//  PatientDashboardViewController.swift
//  reMEDI
//
//  Created by Ruhi Kore on 9/8/18.
//  Copyright © 2018 Ruhi Kore. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class PatientDashboardViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func myActBtnPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "patientAcctInfo", sender: self)
    }
    
    
    @IBAction func newPostBtnPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "makeANewPostSegue", sender: self)
    }
    
    @IBAction func prevPostsBtnPressed(_ sender: Any) {
       self.performSegue(withIdentifier: "prevPostsSegue", sender: self)
    }
    
}
